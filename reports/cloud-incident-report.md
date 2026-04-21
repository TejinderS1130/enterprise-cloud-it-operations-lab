#  SOC Incident Report: Web Application Attack (SQL Injection)

---

##  Incident Overview

| Field | Value |
|------|------|
| Severity | Medium |
| Status | Detected & Mitigated |
| Analyst | Tejinder Singh |
| Environment | AWS Cloud (EC2, WAF, GuardDuty) |
| Application | DVWA (Damn Vulnerable Web App) |

---

##  Executive Summary

A **SQL Injection attack** was attempted against a public-facing web application hosted in AWS.

The attack was successfully **detected and blocked by AWS WAF**, preventing any interaction with the backend database.

Additional telemetry from GuardDuty indicated reconnaissance activity, suggesting broader attacker intent.

---

##  Attack Description

The attacker attempted to manipulate backend database queries using crafted input to bypass authentication mechanisms.

###  Attack Objective

- Bypass authentication controls  
- Manipulate backend database queries  
- Gain unauthorized access  

---

##  Attack Flow

| Step | Activity |
|------|--------|
| 1 | Attacker accessed public-facing web application |
| 2 | Malicious SQL payload submitted via login form |
| 3 | Payload matched SQL injection signature |
| 4 | AWS WAF inspected and blocked the request |
| 5 | Attack prevented before reaching backend |

---

##  Detection Summary

| Layer | Tool | Detection Type |
|------|------|---------------|
| Application Layer | AWS WAF | Signature-based |
| Monitoring Layer | CloudWatch | Behavioral |
| Threat Detection | GuardDuty | ML-based |

---

##  SOC Investigation Methodology

###  Alert Identification
- Suspicious request detected at WAF layer  
- HTTP response: **403 Forbidden**

---

###  Log Analysis
- Reviewed WAF logs and request patterns  
- Identified payload:
```
1' OR '1'='1
```

---

###  Activity Validation
- Confirmed SQL injection signature match  
- Verified request blocked before reaching EC2  

---

###  Threat Correlation
- Reviewed GuardDuty findings  
- Detected:
```
Recon:EC2/Portscan
```

---

###  Environment Verification
- No EC2 compromise  
- No database access  
- No persistence observed  

---

##  Response Actions

### Immediate Response
- Malicious request blocked by AWS WAF  
- No further escalation required  

---

### Defensive Controls Implemented
- Enabled AWS WAF managed rule sets  
- Configured SQL injection protection  
- Attached WAF to Application Load Balancer  

---

### Monitoring Enhancements
- Enabled CloudWatch logging  
- Configured SNS alerts  

---

##  Indicators of Compromise (IOCs)

| Type | Value |
|-----|------|
| Attack Type | SQL Injection |
| Payload | 1' OR '1'='1 |
| Response | HTTP 403 |
| Detection Source | AWS WAF |
| Additional Indicator | GuardDuty Port Scan |

---

##  False Positive Analysis

### Potential False Positives
- Security testing activity  
- Malformed but legitimate user input  

---

### Validation Approach
- Verified known SQL injection pattern  
- Correlated across multiple detection layers  
- Confirmed malicious intent  

---

##  Detection Engineering Insights

- WAF provides fast, signature-based protection  
- CloudWatch enables behavioral anomaly detection  
- GuardDuty adds ML-based threat detection  
- Multi-layer detection improves accuracy and visibility  

---

##  Impact Assessment

| Metric | Value |
|-------|------|
| Systems Affected | 0 |
| Execution | Blocked |
| Data Exposure | None |
| Persistence | None |
| Detection Time | Real-time |
| Response Time | Immediate |

---

##  MITRE ATT&CK Mapping

| Tactic | Technique | ID |
|-------|----------|----|
| Initial Access | Exploit Public-Facing Application | T1190 |
| Credential Access | SQL Injection (Simulated) | T1003 |
| Execution | User Input Exploitation | T1204 |
| Reconnaissance | Port Scanning | T1046 |

---

##  Lessons Learned

- Public-facing applications are high-risk targets  
- WAF is critical for application-layer protection  
- Defense-in-depth enhances detection and response  
- Early detection prevents backend compromise  

---

##  SOC Analyst Conclusion

This incident demonstrates **successful detection and mitigation of a web application attack** using AWS-native security services.

The SQL injection attempt was **blocked at the WAF layer**, preventing any impact to backend systems.

GuardDuty provided additional context by identifying reconnaissance activity, strengthening the overall threat assessment.

###  Key Takeaways

- WAF is essential for protecting public-facing applications  
- Multi-layer detection (WAF + CloudWatch + GuardDuty) is highly effective  
- Real-time blocking prevents compromise  
- Cloud-native tools enable efficient SOC operations  

---
