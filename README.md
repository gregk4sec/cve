# gregk4sec CVE Archive

![Original Research](https://img.shields.io/badge/Research-Original%20Discovery-blueviolet?style=for-the-badge&logo=github)
![Verified Security Researcher](https://img.shields.io/badge/Verified-Security%20Researcher-2ea44f?style=for-the-badge&logo=shield)
![CVE Contributor](https://img.shields.io/badge/CVE-Contributor-critical?style=for-the-badge&logo=cve)
![Security Research Archive](https://img.shields.io/badge/Security-Research%20Archive-0A66C2?style=for-the-badge&logo=apache)


**Security Researcher Since 2025 & Principal Architect.**  

Author of **CVE‑2026‑21962** (Oracle OHS, CVSS 10.0), **CVE-2025-31651** (Apache Tomcat, CVSS 9.8) and **CVE‑2025‑24813** (Apache Tomcat, CVSS 9.8).  

Specializing in Middleware, Cloud & Infra, and high‑severity server‑side flaws.

---

# 📚 Table of Contents

- [Introduction](#introduction)
- [Repository Structure](#repository-structure)
- [Research Focus](#research-focus)
- [Published CVEs](#published-cves)
- [Attribution](#attribution)
- [How to Cite](#how-to-cite)
- [Disclaimer](#disclaimer)

---

# Introduction

This repository contains **original security vulnerabilities (CVEs) discovered by gregk4sec with k4security Lab**.  
It serves as the **official archive** for:

- Technical analysis  
- Reproduction steps & partial PoCs  
- Vendor communication & disclosure timeline  
- Impact assessment & security recommendations  

---

# Repository Structure

```
/CVE-YYYY-XXXX/
    README.md           # Vulnerability description
    analysis.md         # Technical analysis
    timeline.md         # Disclosure timeline
    poc/                # Partial PoCs
    vendor-response/    # Vendor communication
    screenshots/        # Reproduction evidence
```

---

# Research Focus

**English**

- Web & application security  
- Protocol implementation flaws  
- Authentication & authorization bypass  
- Memory safety issues (C/C++)  
- Cloud platform & infrastructure security  

---

# Published CVEs

This repository contains all of my CVEs and Security Findings.

<!-- SUMMARY-START -->
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
<!-- SUMMARY-END -->

---

# Attribution

**English**  
All vulnerabilities in this repository are **original research** by gregk4sec.  
Attribution is required when referencing this work.

Official repository:  
https://github.com/gregk4sec/cve

---

# How to Cite

## English Citation Format

```
gregk4sec with k4security Lab. gregk4sec Original Vulnerability Research Archive (CVE Archive).
GitHub repository: https://github.com/gregk4sec/cve
```

## 中文引用格式

```
gregk4sec with k4security Lab. 《gregk4sec 原创漏洞研究档案（CVE Archive）》.
GitHub 仓库：https://github.com/gregk4sec/cve
```

## APA Format

```
gregk4sec with k4security Lab. gregk4sec CVE Archive: Original Vulnerability Research. GitHub.
https://github.com/gregk4sec/cve
```

## BibTeX

```bibtex
@misc{gregk_cve_archive,
  author       = {gregk4sec with k4security Lab},
  title        = {gregk4sec CVE Archive: Original Vulnerability Research},
  year         = {2026},
  howpublished = {\url{https://github.com/gregk4sec/cve}},
  note         = {Original security vulnerability discoveries and analyses}
}
```

---

# Disclaimer

This repository is intended for security research and educational purposes only.  
Unauthorized exploitation of the information provided is strictly prohibited.
