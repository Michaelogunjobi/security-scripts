# security-scripts
Bash security automation, Scripts for Linux system auditing, Network scanning and log monitoring
# 🔐 Security Scripts — Linux Security Automation

A collection of bash security scripts for 
Linux system auditing, network reconnaissance, 
user management auditing, and log monitoring.

Built as part of my cybersecurity learning journey 
toward becoming a Cloud Security Analyst.

---

## 📋 Scripts Overview

| Script | Purpose | Privilege Required |
|--------|---------|-------------------|
| system_info.sh | System reconnaissance | No sudo |
| user_audit.sh | User security audit | Sudo required |
| network_scan.sh | Network host discovery | No sudo |
| log_monitor.sh | Log analysis + alerting | Sudo required |

---

## 🛠️ Scripts

### 1. system_info.sh — System Information Gathering
**Purpose:** Collects key system information 
for security baseline documentation

**What it does:**
- Hostname, date, uptime
- Number of logged in users
- Running process count
- IP address and open port count
- Disk usage analysis

**Usage:**
```bash
chmod +x system_info.sh
./system_info.sh
```

**Sample Output:**
