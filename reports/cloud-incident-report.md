# SOC Incident Report: Web Application Attack (SQL Injection)

---

## Incident Overview

| Field | Value |
|------|------|
| Severity | Medium |
| Status | Detected & Mitigated |
| Analyst | Tejinder Singh |
| Environment | AWS Cloud (EC2, WAF, GuardDuty) |
| Application | DVWA (Damn Vulnerable Web App) |

---

## Attack Description

This incident involves a **web application attack (SQL Injection)** targeting a vulnerable application hosted on an AWS EC2 instance.

The attacker attempted to manipulate backend database queries using crafted input to bypass authentication mechanisms.

### Attack Objective

- Bypass authentication controls  
- Manipulate backend database queries  
- Gain unauthorized access to the application  

---

## Attack Flow

| Step | Activity |
|------|--------|
| 1 | Attacker accessed public-facing web application |
| 2 | Malicious SQL payload submitted via login form |
| 3 | Input matched known SQL injection pattern |
| 4 | AWS WAF inspected and blocked the request |
| 5 | Attack prevented before reaching backend database |

---

## Detection Summary

| Layer | Tool | Detection Type |
|------|------|---------------|
| Application Layer | AWS WAF | Signature-based (SQL Injection) |
| Monitoring Layer | CloudWatch | Behavioral (traffic/activity anomalies) |
| Threat Detection | GuardDuty | ML-based (reconnaissance activity) |

---

## SOC Investigation Methodology

### Step 1 — Alert Identification
- Suspicious request detected at WAF layer  
- HTTP response returned: 403 Forbidden  

---

### Step 2 — Log Analysis
- Reviewed WAF logs and request patterns  
- Identified SQL injection payload: 1' OR '1'='1  

---

### Step 3 — Activity Validation
- Confirmed request matched SQL injection signature  
- Verified request was blocked before reaching EC2 instance  

---

### Step 4 — Threat Detection Correlation
- Reviewed GuardDuty findings  
- Identified reconnaissance activity: Recon:EC2/Portscan  

---

### Step 5 — Environment Analysis
- Verified no compromise of EC2 instance  
- No unauthorized database access detected  
- No persistence mechanisms observed  

---

## Response Actions

### Immediate Actions
- AWS WAF blocked malicious request  
- No further action required at application level  

---

### Defensive Measures
- Enabled AWS WAF managed rule sets  
- Configured SQL injection protection rules  
- Attached WAF to Application Load Balancer  

---

### Monitoring Enhancements
- Enabled CloudWatch logging  
- Configured SNS alerts for suspicious activity  

---

## Key Indicators of Compromise (IOCs)

| Indicator Type | Value |
|---------------|------|
| Attack Type | SQL Injection |
| Payload | 1' OR '1'='1 |
| Response | HTTP 403 Forbidden |
| Detection Source | AWS WAF |
| Additional Finding | GuardDuty Port Scan |

---

## False Positives Consideration

### Potential False Positives
- Security testing or lab-based simulation  
- Legitimate malformed input from users  

---

### Validation Approach
- Correlated request patterns with known attack signatures  
- Confirmed malicious intent based on payload structure  
- Verified WAF rule trigger accuracy  

---

## Detection Engineering Insights

- WAF provides fast, signature-based protection against known attacks  
- CloudWatch enables behavioral monitoring of application activity  
- GuardDuty enhances detection using machine learning and threat intelligence  
- Multi-layer detection improves visibility and response accuracy  

---

## Lessons Learned

- Public-facing applications are high-risk targets  
- Input validation alone is insufficient without WAF protection  
- Defense-in-depth is critical in cloud environments  
- Early detection prevents backend compromise  

---

## MITRE ATT&CK Mapping

| Tactic | Technique | ID |
|-------|----------|----|
| Initial Access | Exploit Public-Facing Application | T1190 |
| Credential Access | SQL Injection (Simulated) | T1003 |
| Execution | User Input Exploitation | T1204 |
| Reconnaissance | Port Scanning | T1046 |

---

## Impact Assessment

| Metric | Value |
|-------|------|
| Systems Affected | 0 |
| Execution | Blocked |
| Data Exposure | None |
| Persistence | None |
| Detection Time | Real-time |
| Response Time | Immediate |

---

## SOC Analyst Summary

This incident demonstrates a **successful detection and mitigation of a web application attack** using AWS native security services.

The SQL injection attempt was identified and blocked by AWS WAF before reaching the backend application, preventing unauthorized access.

GuardDuty provided additional visibility by detecting reconnaissance activity, reinforcing the presence of a potential threat actor.

### Key Takeaways:

- WAF is critical for protecting public-facing applications  
- Multi-layer detection (WAF + CloudWatch + GuardDuty) enhances security posture  
- Real-time blocking prevents application compromise  
- Cloud-native security tools enable effective SOC operations  

---
