# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a portfolio repository for a 6-month DevOps self-study roadmap (beginner to job-ready junior DevOps/Cloud Engineer). Everything goes in this single repo: shell scripts, Terraform code, Dockerfiles, Kubernetes manifests, and CI/CD pipeline YAMLs. The repo doubles as an interview portfolio.

## Roadmap Phases

1. **Foundations** (Weeks 1–4): Linux CLI, networking, Git, Bash scripting
2. **Infrastructure** (Weeks 5–10): AWS core services + Terraform (VPC, ALB, ASG, S3, remote state)
3. **Containers** (Weeks 11–16): Docker, Docker Compose, Kubernetes, Helm
4. **CI/CD** (Weeks 17–20): GitHub Actions pipelines (lint, build, scan, deploy)
5. **Observability** (Weeks 21–24): Prometheus, Grafana, Loki, alerting, SLOs

Each phase has a capstone project that extends the previous one.

## Current State — Phase 1

Working on the Phase 1 capstone ("System Audit Toolkit"):
- `sysreport.sh` — in-progress shell script for one-page system health summary (uptime, disk usage, top 5 processes by memory, listening ports, failed login attempts, last 10 sudo invocations)
- Still needed: SSH hardening docs, cron/systemd scheduling, README with setup instructions, feature branch + PR workflow

## Running Scripts

```bash
bash sysreport.sh
# or
chmod +x sysreport.sh && ./sysreport.sh
```

## Shell Script Conventions

- Use `set -euo pipefail` for error handling
- `.sh` extension with a comment header describing purpose
- Lint with `shellcheck`

## Terraform Conventions (Phase 2+)

- Remote state in S3 with DynamoDB locking
- Never commit `*.tfstate*` or `.terraform/`
- Never commit secrets; use variables or AWS OIDC
- Run `terraform fmt` and `terraform validate` before committing

## Docker Conventions (Phase 3+)

- Multi-stage builds, non-root user, images under 200MB
- Use Docker Compose for local multi-container development

## CI/CD Conventions (Phase 4+)

- Pipeline stages: lint → test → build → publish → deploy
- AWS credentials via GitHub OIDC, never static keys
- Scan container images with Trivy; fail on HIGH/CRITICAL CVEs

## Key Principles

- Document as you go — keep a `NOTES.md` for learnings
- Break things on purpose in this sandbox to learn recovery
- Set cloud billing alarms ($10 threshold) from day one
- Prefer official docs over blog posts
- Commit history matters — write meaningful commit messages
