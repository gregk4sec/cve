# Case Study: Cross-Tenant DoS via Tomcat Native Memory Leak when reloadSslHostConfigs

**Author:** gregk4sec (https://github.com/gregk4sec/cve)   
**Date:** 2026-03-11  

A potential native leak at tomcat startup and ssl reload were identified, violating **"Secure by default" promise**.

***This finding has been rejected by Tomcat Security Team.***

**Story:** https://medium.com/@gregk4sec/the-silent-killer-in-cloud-native-a-deep-dive-into-a-tomcat-native-memory-leak-25cda8fa722e

---

## 1. Summary

A memory leak identified in the JNI code of SSLContext#addClientCACertificateRaw (see sslcontext.c).

When APR + Tomcat Native are enabled, this vulnerability allows for persistent growth of the native heap (RSS) which is not managed by JVM GC. In shared-resource multi-tenant environments, the frequency and volume of certificate reloads are directly tied to tenant-side actions. The lack of resource accounting for native memory allows a single malicious or heavy-usage tenant to exhaust the host's physical memory.

This results in a Cross-Tenant Denial of Service, where the actions of one user (frequent certificate updates) lead to the termination of the entire server process via the OOM Killer, impacting all other innocent tenants on the same infrastructure.

Target: Tomcat APR + Tomcat Native Connector.

---

## 2. Analysis

A X509 cert was unreleased in sslcontext.c:

```c
cert = d2i_X509(NULL, &tmp, lengthOfCert);
if (cert == NULL) {
ERR_error_string_n(SSL_ERR_get(), err, TCN_OPENSSL_ERROR_STRING_LENGTH);
tcn_Throw(e, "Error encoding allowed peer CA certificate (%s)", err);
rv = JNI_FALSE;
} else if (SSL_CTX_add_client_CA(c->ctx, cert) <= 0) {
ERR_error_string_n(SSL_ERR_get(), err, TCN_OPENSSL_ERROR_STRING_LENGTH);
tcn_Throw(e, "Error adding allowed peer CA certificate (%s)", err);
rv = JNI_FALSE;
}

free(charCert);
return rv;
```

Vulnerable Code Path: ManagerServlet#sslReload / JMX ProtocolHandler#reloadSslHostConfigs → SSLUtil#createSSLContext() → OpenSSLContext#init() → SSLContext#addClientCACertificateRaw → ssl_cert.c

According to OpenSSL's ssl_cert.c, SSL_CTX_add_client_CA() simply duplicates the Subject Name of the certificate (via X509_NAME_dup). It does not take ownership of the X509 object itself. Therefore, the lifecycle management of the X509 object remains the responsibility of the caller (Tomcat Native).

Weakness: CWE-400 / CWE-401

CWE-400: Uncontrolled Resource Consumption (Resource Exhaustion)
CWE-401: Missing Release of Memory after Effective Lifetime

---

## 3. Scenario

In modern SaaS architectures, certificate hot-reloading is a standard high-availability feature. A typical automation pipeline looks like: Certificate Modification / Expiration → Cert Change Event Detector → JMX (ProtocolHandler#reloadSslHostConfigs) → Tomcat SSL Host Config Reload.

An attacker acting as a tenant can trigger thousands of "Update Certificate" events. Since each event leaks native memory that persists beyond the SSLContext lifecycle, this allows a single tenant to bypass JVM -Xmx limits and exhaust the shared host's physical memory.

PoC Scripts - simulate tenant cert-file update with `sslReload`:

```bash
# print date and rss/vsz of tomcat pid
for i in {1..10000}
do
  # Triggering the official reload mechanism
  curl -s -u admin:password "http://localhost:8080/manager/text/sslReload" > /dev/null

  # If i%100 == 0, print date and rss/vsz of tomcat pid
done

# Finally force server GC via /manager/text/findleaks
curl -s -u admin:password "http://localhost:8080/manager/text/findleaks" > /dev/null
# print date and rss/vsz of tomcat pid
```


Observed RSS results:
 Persistent growth: 208.2MB (times: 100) → 225.6MB (times: 10000)
 Unrecoverable Leak: 225.6MB (times: 10000) → 220.8MB (manager findleaks: full GC)
 Net Native Leak: A net increase of 12.6MB (220.8 - 208.2) of physical memory was permanently leaked in native heap

---

## 4. Multi-Tenant Attack Vector: The "Noisy Neighbor" DoS

While the sslReload action is administrative, in modern cloud-native architectures, this action is often indirectly reachable by untrusted tenants.

* Scenario: A SaaS provider uses Apache Tomcat as a TLS termination gateway for thousands of customers.

* The Mechanism: Each customer can upload their own custom SSL certificates via a web dashboard. When a certificate is uploaded, the SaaS control plane automatically triggers reloadSslHostConfigs via JMX or the Manager API to apply the change without downtime.

* The Exploit: A malicious tenant script repeatedly updates their certificate or alternates between multiple subdomains. Each "legitimate" administrative update pushes the Tomcat process closer to its limit.

* The Impact: Because the leak is in the Native Heap, it bypasses JVM -Xmx limits. Once the Host RAM is exhausted, the Linux OOM Killer may terminate the entire Tomcat process or even adjacent database containers, achieving a cross-tenant Denial of Service.

---

## 5. Why "Secure by Default" Matters Here

The rejection by the security team often relies on the "Trusted Admin" premise. However, this finding challenges that premise:

* Observability Gap: Standard Java monitoring (Prometheus/JMX) shows a healthy heap, hiding the impending system collapse from the SRE team.

* Involuntary Trigger: Automation tools (Cert-Manager/Kubernetes Operators) trigger this "administrative action" without human oversight, turning a maintenance feature into a self-inflicted DoS vector.

---

## 6. Recommended Mitigation

1. Patch - free X509 after use. see [PR 44](https://github.com/apache/tomcat-native/pull/44) 
    ```c
    /*L1237 of sslcontext.c */
    + if (cert) {
    +   X509_free(cert);
    + }
    free(charCert);
    return rv;
    ```

1. Workaround
- Implement rate-limiting on certificate update APIs at the application level.
- Schedule periodic graceful restarts of Tomcat instances to clear the native heap.
- Monitor Process RSS vs Java Total Heap and alert on significant divergence.

---

-EOF-