# Security Research Summary
Unified Index of CVEs and Security Findings
Maintained by: **gregk4sec** (https://github.com/gregk4sec/cve)

---

## Cve Summary Table

| Index | Type | ID / Case | Title | Severity | Vendor | Year | Status | Repository |
|-------|------|-----------|--------|----------|--------|-------|---------|------------|
| 0x01 | cve | CVE-2025-24813 | (Co-author) - Potential RCE and/or information disclosure and/or information corruption with partial PUT | 9.8 | Apache | 2025 | Public | https://github.com/gregk4sec/cve-2025-24813 |
| 0x02 | cve | CVE-2025-31651 | Rewrite rule bypass | 9.8 | Apache | 2025 | Public | https://github.com/gregk4sec/cve-2025-31651 |
| 0x03 | cve | CVE-2025-46701 | CGI security constraint bypass | 7.3 | Apache | 2025 | Public | https://github.com/gregk4sec/cve-2025-46701 |
| 0x04 | cve | CVE-2025-49125 | Security constraint bypass for pre/post-resources | 7.5 | Apache | 2025 | Public | https://github.com/gregk4sec/cve-2025-49125 |
| 0x05 | cve | CVE-2025-55668 | Apache Tomcat - Session fixation via rewrite valve | 6.5 | Apache | 2025 | Public | https://github.com/gregk4sec/cve-2025-55668 |
| 0x06 | cve | CVE-2025-9498 | <TBD> Bugzilla critical sensitive information disclosure | <TBD> | Mozilla | 2025 | Private | https://github.com/gregk4sec/cve-2025-9498 |
| 0x07 | cve | CVE-2026-21962 | Oracle OHS Path Traversal | 10.0 | Oracle | 2026 | Public | https://github.com/gregk4sec/cve-2026-21962 |
| 0x08 | cve | CVE-2026-25854 | Tomcat Open Redirection |  | Apache | 2026 | Private | https://github.com/gregk4sec/cve-2026-25854 |
| 0x09 | cve | CVE-2026-29145 | Tomcat Client-Cert OCSP Bypass to Auth Bypass |  | Apache | 2026 | Private | https://github.com/gregk4sec/cve-2026-29145 |
---

## Security Findings Summary Table

| Index | Type | ID / Case | Title | Severity | Vendor | Year | Status | Repository |
|-------|------|-----------|--------|----------|--------|-------|---------|------------|
| 0x01 | finding | MSRC-99269 | **Mirror of CVE-2026-21962** Remote attacker could RCE / Access Unexposed Internal Servlet App Due to inconsistent URI path normalization behavior between IIS and proxied backend Servlet Container | Low | Microsoft | 2025 | Public & Won't Fix | https://github.com/gregk4sec/msrc-99269 |
| 0x02 | finding | MSRC-100937 | **Mirror of CVE-2026-21962** Path based routing rule in Azure Application Gateway allows HTTP Path Traversal / Equivalence attack |  | Microsoft | 2025 | Private & Rejected | https://github.com/gregk4sec/msrc-100937 |
| 0x03 | finding | MSRC-102586 | **Mirror of CVE-2026-21962** Azure App Service Authentication V2 Path Traversal Bypass Enables MFA Evasion and Privilege Escalation | High | Microsoft | 2025 | Private & Confirmed | https://github.com/gregk4sec/msrc-102586 |
| 0x04 | finding | MSRC-102516 | **Mirror of CVE-2026-21962** Incorrect Path Handling Enabling Path Traversal, Unauthorized Access to on-prem apps (SSO bypass → creds theft / data exfiltration / EoP / RCE) | Low | Microsoft | 2025 | Private & Confirmed | https://github.com/gregk4sec/msrc-102516 |
| 0x05 | finding | MSRC-102259 | Symbolic Link Dereference in App Service Mounted Storage Leading to Full Azure App Service Infrastructure Takeover | Critical | Microsoft | 2025 | Public & Rejected | https://github.com/gregk4sec/msrc-102259 |
