# 🔓 Advisory: URI Normalization Weakness Enables Cross-Service Path Traversal and Trust Injection

## 📅 Disclosure Timeline

- **2025-07-05**: Initial report to MSRC via Windows Insider Preview / IIS  
- **2025-07 to 2025-10**: Additional submissions to Web App, Container App, APIM, WAF, FrontDoor, Load Balancer  
- **Web App**: Accepted and rewarded (initially Critical, later downgraded)  
- **Container App**: Marked as duplicate  
- **Other surfaces**: Declined with varied reasoning (“designed behavior”, “not a security component”, “customer misconfiguration”)  
- **2025-11**: Oracle OHS accepted similar report, CVE expected in next CPU  
- **2025-11**: MSRC requested 60-day extension on IIS case (now >130 days)  
- **This advisory**: Published after 90-day window, due to unresolved classification and platform-wide exposure

## 🧭 Summary

Multiple Azure services fail to normalize request URIs before applying routing or trust logic. This enables attackers to craft traversal-based paths (e.g., `/%2e%2e%2f`,`<CONFIDENTIAL-PATH-TRAVERSAL>`) that bypass access controls, mislead platform routing, and trigger backend trust injection.

## 🚨 Impact Summary

- Authentication bypass on Web App and Container App  
- Trust header injection in API Management  
- IMDS token access → Function App deployment → RCE  
- Cross-tenant exposure in shared platform environments

## 🧪 Affected Surfaces

- Azure Web App  
- Azure Container App  
- Azure API Management  
- Azure FrontDoor (declined)  
- Azure WAF (declined)  
- Azure Load Balancer (declined)  
- Possibly others (e.g., Logic Apps, ASE)

## 📚 Industry Precedent

- Oracle OHS accepted similar path traversal report  
- CVE expected in next Critical Patch Update (Q1 2026)

## 🧠 Disclosure Position

Despite early reporting and multiple submissions, MSRC has declined or collapsed most findings into a single root cause. This undermines coordinated disclosure and disincentivizes early reporting.

We publish this advisory to document the platform-wide risk, encourage remediation across services, and advocate for fair recognition of surface-specific exploitability.

## 📬 Researcher Statement

If another researcher submits a similar exploit on Azure Load Balancer or WAF after Oracle’s CVE goes public and MSRC accepts it, that would be deeply discouraging. It signals that early reporting leads to rejection, while delayed submission post-precedent leads to reward — a reverse incentive that undermines coordinated disclosure.

## 🧾 Contact

Researcher: Greg K with k4security Lab
MSRC Cases: 102586 (Web App), 102650 (Container App), others pending  
Contact: [gregk4sec-github](https://github.com/gregk4sec) gregk4sec@hotmail.com  
