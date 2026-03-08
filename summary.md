# Security Research Summary  
Unified Index of CVEs and Security Findings  
Maintained by: **gregk4sec** (https://github.com/gregk4sec/cve)

---

## Table Legend
- **Type**  
  - `CVE` — Public or private CVE repository  
  - `Finding` — Security finding without a CVE (MSRC, Google, Oracle, Apache, etc.)

- **Status**  
  - `Public` — Public repository  
  - `Private` — Private repository  
  - `Under Review` — Vendor triage in progress  
  - `Fixed` — Vendor patch released  
  - `Won’t Fix` — Vendor declined  
  - `Duplicate` — Vendor marked as duplicate  

---

## Summary Table

| Index | Type | ID / Case | Title | Severity | Vendor | Year | Status | Repository |
|-------|------|-----------|--------|----------|--------|-------|---------|------------|
| 0x01 | CVE | CVE-2026-21962 | Oracle OHS Request Smuggling | Critical (10.0) | Oracle | 2026 | Public | [Link](https://github.com/gregk4sec/cve-2026-21962) |
| 0x02 | CVE | CVE-2025-24813 | Apache Tomcat TLS Auth Bypass | Critical (9.8) | Apache | 2025 | Public | [Link](https://github.com/gregk4sec/cve-2025-24813) |
| 0x03 | Finding | MSRC Case 123456 | Windows Authentication Logic Issue | High | Microsoft | 2025 | Under Review | Private |
| 0x04 | Finding | Google Issue 987654 | Chrome URL Parser Inconsistency | Medium | Google | 2024 | Acknowledged | Private |
| 0x05 | Finding | Oracle CPU Submission 2024-Q3 | Oracle WebLogic Input Validation Issue | High | Oracle | 2024 | Won’t Fix | Private |
| 0x06 | Finding | Apache Security Case 2024-001 | Apache HTTPD Request Handling Bug | High | Apache | 2024 | Fixed | Private |

---

## Notes

- Private repositories are intentionally not linked.  
- Public repositories should follow the standardized structure and templates.  
- This table is designed for future automation using `metadata.json` from each repo.  

---

## Attribution

All research listed in this summary is discovered by **gregk4sec (https://github.com/gregk4sec/cve)**.  
Main archive: https://github.com/gregk4sec/cve
