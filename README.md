# 🛡️ Enterprise Cloud Security Lab – Attack, Detection & Defense (AWS + SOC Simulation)

<p align="center">
  <img src="https://img.shields.io/badge/Cloud-AWS-orange?style=for-the-badge&logo=amazonaws">
  <img src="https://img.shields.io/badge/Security-WAF%20%7C%20GuardDuty-red?style=for-the-badge">
  <img src="https://img.shields.io/badge/Monitoring-CloudWatch-blue?style=for-the-badge&logo=amazoncloudwatch">
  <img src="https://img.shields.io/badge/Attack-SQL%20Injection-critical?style=for-the-badge">
  <img src="https://img.shields.io/badge/Level-SOC%20Simulation-success?style=for-the-badge">
</p>

---

## 📌 Overview

This project simulates a **real-world enterprise cloud security environment**, demonstrating how a SOC analyst builds infrastructure, detects threats, and responds to attacks.

It covers the full lifecycle:

> **Infrastructure → Attack Simulation → Detection → Investigation → Defense**

---

## 🎯 Objectives

* Build cloud + virtualized infrastructure
* Simulate real-world attack (**SQL Injection**)
* Monitor activity using cloud-native tools
* Detect threats and generate alerts
* Block malicious activity using security controls

---

## 🧠 Architecture

```
🌐 Attacker (Internet)
        │
        ▼
┌────────────────────────────┐
│ Application Load Balancer  │
│ (Protected by AWS WAF)     │
└─────────────┬──────────────┘
              │
              ▼
┌────────────────────────────┐
│ EC2 Instance (DVWA)        │
│ Vulnerable Web Application │
└─────────────┬──────────────┘
              │
              ▼
        MySQL Database

              │
              ▼
┌────────────────────────────┐
│ CloudWatch (Logs & Alerts) │
└─────────────┬──────────────┘
              │
              ▼
     SNS Notifications

🛡️ GuardDuty → Threat Detection Engine
```

---

## ⚙️ Technologies Used

| Category          | Tools                      |
| ----------------- | -------------------------- |
| Cloud             | AWS EC2, VPC               |
| Security          | AWS WAF, GuardDuty         |
| Monitoring        | CloudWatch, SNS            |
| Virtualization    | VMware                     |
| OS                | Ubuntu Linux               |
| Attack Simulation | DVWA                       |
| Networking        | Subnets, IGW, Route Tables |
| Access            | SSH                        |

---

## 🔧 Environment Setup

### Local Infrastructure (VMware)

* Deployed Ubuntu virtual machines
* Configured SSH access
* Verified internal connectivity

### Cloud Infrastructure (AWS)

* Created custom VPC
* Configured public/private subnets
* Attached Internet Gateway
* Built route tables

### Compute Layer

* Launched EC2 instance
* Configured Security Groups (SSH + HTTP)
* Connected via SSH

---

## 💣 Attack Simulation

A vulnerable application (**DVWA**) was deployed and tested using SQL Injection:

```
Username: admin
Password: 1' OR '1'='1
```

### Result:

* Authentication bypass attempt
* Demonstrates real-world web attack behavior

---

## 🚨 Detection & Monitoring

### CloudWatch

* Monitored EC2 activity
* Collected logs and metrics

### SNS Alerts

* Generated alerts for:

  * Instance state changes
  * Suspicious activity

---

## 🛡️ Defensive Controls

### AWS WAF

* Configured SQL Injection protection
* Attached to Application Load Balancer

### ✅ Validation:

* Malicious request blocked
* Returned:

```
403 Forbidden
```

---

## 🔍 Threat Detection

### AWS GuardDuty

* Detected suspicious activity:

  * Port scanning
  * Reconnaissance behavior

### Example Finding:

* **Type:** Recon:EC2/Portscan
* **Severity:** Medium
* **Detection:** Near real-time

---

## 🔄 SOC Workflow

```
Attack → Detection → Alert → Investigation → Response → Mitigation
```

---

## 🧩 MITRE ATT&CK Mapping

| Tactic            | Technique                 | ID    |
| ----------------- | ------------------------- | ----- |
| Initial Access    | Exploit Public-Facing App | T1190 |
| Credential Access | SQL Injection (Simulated) | T1003 |
| Execution         | User Input Exploitation   | T1204 |
| Reconnaissance    | Port Scanning             | T1046 |

---

## 📸 Key Evidence

```html
<img src="./screenshots/01-ubuntu-vm-running.png" width="900"/>
<img src="./screenshots/02-linux-system-access.png" width="900"/>
<img src="./screenshots/03-vm-connectivity-test.png" width="900"/>

<img src="./screenshots/04-ec2-instance-running.png" width="900"/>
<img src="./screenshots/05-ec2-ssh-access.png" width="900"/>
<img src="./screenshots/06-ec2-connectivity-test.png" width="900"/>

<img src="./screenshots/07-aws-vpc-overview.png" width="900"/>
<img src="./screenshots/08-subnet-configuration.png" width="900"/>
<img src="./screenshots/09-route-table-configuration.png" width="900"/>
<img src="./screenshots/10-network-security-controls.png" width="900"/>

<img src="./screenshots/11-dvwa-web-application.png" width="900"/>
<img src="./screenshots/12-sql-injection-attack.png" width="900"/>
<img src="./screenshots/13-cloudwatch-monitoring.png" width="900"/>
<img src="./screenshots/14-cloud-alerts-triggered.png" width="900"/>

<img src="./screenshots/15-waf-sql-injection-block.png" width="900"/>
<img src="./screenshots/16-waf-security-rules.png" width="900"/>
<img src="./screenshots/17-guardduty-threat-detection.png" width="900"/>
<img src="./screenshots/18-guardduty-finding-details.png" width="900"/>
```

---

## 📁 Project Structure

```
enterprise-cloud-security-lab/
│
├── screenshots/
├── architecture/
│   └── architecture-diagram.png
├── scripts/
│   └── dvwa-install.sh
└── README.md
```

---

## 🚀 Future Improvements

* Integrate SIEM (Splunk / Microsoft Sentinel)
* Add automated response (AWS Lambda)
* Implement IDS/IPS (Suricata)
* Add brute-force attack simulation
* Advanced threat hunting

---

## 👨‍💻 Author

**Tejinder Singh**
SOC Analyst | Cloud Security | Threat Detection

---

## 🔥 Why This Project Stands Out

* End-to-end SOC simulation
* Real attack + real defense
* Cloud + security + monitoring combined
* Demonstrates **Tier 1 → Tier 2 SOC capability**

---
