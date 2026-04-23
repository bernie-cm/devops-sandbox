# DevOps Sandbox

Portfolio repository for a 6-month DevOps self-study roadmap, from beginner to job-ready junior DevOps/Cloud Engineer.

## Phase 1 — System Audit Toolkit

### sysreport.sh

A Bash script that outputs a one-page system health summary:

- System uptime
- Disk usage
- Top 5 processes by memory
- Listening ports
- Failed login attempts
- Last 10 sudo invocations

**Target environment:** Ubuntu Server 24.04 LTS

### Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/bernie-cm/devops-sandbox.git
   cd devops-sandbox
   ```

2. Make the script executable and run it:
   ```bash
   chmod +x sysreport.sh
   ./sysreport.sh
   ```

   Some sections (failed logins, sudo invocations) require `sudo` to read `/var/log/auth.log`.

### SSH Hardening

The Phase 1 capstone also includes SSH hardening on the Ubuntu VM:

- Password authentication disabled (`PasswordAuthentication no` in `/etc/ssh/sshd_config`)
- SSH moved to non-default port (`Port 2222` in `/etc/ssh/sshd_config` and `ssh.socket` override)
- Key-only authentication

To connect after hardening:
```bash
ssh -i ~/.ssh/<your-key>.pem -p 2222 ubuntu@<public-ip>
```
