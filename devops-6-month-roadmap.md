# DevOps 6-Month Self-Study Roadmap

**Beginner → Job-Ready Junior DevOps / Cloud Engineer**

---

## Overview

| Item | Detail |
|---|---|
| **Duration** | 26 weeks (~6 months) |
| **Time commitment** | ~15 hours/week (~390 total hours) |
| **Split** | 30% theory/reading, 70% hands-on labs |
| **Prerequisite** | Comfort with a computer, willingness to use a terminal, basic English reading for technical docs |
| **Target outcome** | Able to interview for a junior DevOps / Cloud / Platform Engineer role, with a portfolio repo demonstrating each phase |
| **Cost** | $0 on tooling (cloud free tiers + free resources only). Budget ~$20–30/month just in case a cloud bill leaks — set billing alerts from day one. |

> **How to use this roadmap.** Every phase ends with a *capstone project* that extends the previous one. Do not skip capstones — they are the thing you show in interviews. Put *everything* in a single GitHub repository from Week 1: shell scripts, Terraform code, Dockerfiles, K8s manifests, pipeline YAMLs. That repo is your portfolio.

---

## Phase Map

| Phase | Topic | Weeks | Months |
|---|---|---|---|
| 1 | Foundations: Linux, Networking, Git | 1–4 | Month 1 |
| 2 | Infrastructure: AWS + Terraform | 5–10 | Months 2–3 |
| 3 | Containers: Docker + Kubernetes | 11–16 | Months 3–4 |
| 4 | CI/CD: GitHub Actions | 17–20 | Month 5 |
| 5 | Observability: Metrics, Logs, Alerts | 21–24 | Month 6 |
| — | Consolidation + interview prep | 25–26 | Month 6 |

---

# Phase 1 — Foundations (Weeks 1–4)

**Focus:** Linux command line, networking fundamentals, Git version control.
**Why first:** Everything in DevOps runs on Linux and is tracked in Git. If you're shaky here, nothing later sticks.

## Key Concepts

| # | Concept | What "knowing it" looks like |
|---|---|---|
| 1 | **Linux CLI & file system** | Navigate, inspect, and modify files without a GUI; understand `/etc`, `/var`, `/home`, `/usr`; use pipes and redirection fluently. |
| 2 | **Permissions, users, processes** | `chmod`, `chown`, `sudo`, `ps`, `top`, `systemctl`; know the difference between a process, a service, and a daemon. |
| 3 | **Shell scripting (Bash)** | Write scripts with variables, loops, conditionals, functions, and error handling (`set -euo pipefail`). |
| 4 | **Networking fundamentals** | OSI layers (at a high level), TCP vs UDP, IP addressing + CIDR, DNS, HTTP/HTTPS, ports, firewalls, SSH key auth. |
| 5 | **Git workflow** | `clone`, `branch`, `commit`, `merge`, `rebase`, `pull request`; resolve a merge conflict without panic. |

## Primary Resources (all free)

| Resource | Format | What it covers |
|---|---|---|
| [The Linux Command Line](https://linuxcommand.org/tlcl.php) — William Shotts | Free PDF book | The single best introduction to the Linux shell. Read Parts 1–3. |
| [Linux Journey](https://linuxjourney.com/) | Interactive web | Bite-sized lessons; use alongside the Shotts book. |
| [MIT Missing Semester](https://missing.csail.mit.edu/) | Video + notes | Shell, scripting, tooling, Git. Lecture 6 on Git is gold. |
| [OverTheWire: Bandit](https://overthewire.org/wargames/bandit/) | CTF-style labs | Forces you to actually *use* the shell. Do levels 0–20. |
| [Pro Git](https://git-scm.com/book/en/v2) — Chacon & Straub | Free book | Chapters 1–3 cover 90% of what you need. |
| [Learn Git Branching](https://learngitbranching.js.org/) | Interactive visual | Best way to build intuition for branching and rebasing. |
| [Cloudflare Learning Center](https://www.cloudflare.com/learning/) | Articles | Accessible networking explainers: DNS, TLS, CDN, HTTP. |
| [Beej's Guide to Network Concepts](https://beej.us/guide/bgnet0/) | Free book | Deeper networking if you want it. Skim the first half. |
| [GitHub Skills](https://skills.github.com/) | Interactive courses | Free, hands-on courses for Git and GitHub workflows. |

## Capstone Project — "System Audit Toolkit"

Set up an Ubuntu VM (VirtualBox, multipass, WSL2, or a cloud free-tier instance). On that VM:

1. Harden SSH (key-only login, non-default port, fail2ban optional).
2. Write a Bash script `sysreport.sh` that outputs a one-page system health summary: uptime, disk usage, top 5 processes by memory, listening ports, failed login attempts, and last 10 `sudo` invocations.
3. Schedule it daily with `cron` or a systemd timer and email yourself (or log to a file rotated by `logrotate`).
4. Put the script, the systemd unit files, and a `README.md` with setup instructions in a public GitHub repo. Use feature branches and at least one merge via pull request.

## Success Metric

You can SSH into a fresh Linux VM, diagnose why a service isn't starting (checking `systemctl status`, `journalctl`, file permissions, and port conflicts), fix it, commit the fix to a Git branch, and open a pull request — without googling basic command syntax.

---

# Phase 2 — Infrastructure: AWS + Terraform (Weeks 5–10)

**Focus:** Provision and manage cloud infrastructure declaratively.
**Why here:** Modern infrastructure *is* cloud infrastructure, and modern cloud infrastructure is defined as code.

## Key Concepts

| # | Concept | What "knowing it" looks like |
|---|---|---|
| 1 | **AWS core services** | IAM (users, roles, policies, least privilege), VPC (subnets, route tables, IGW, NAT), EC2 (AMIs, key pairs, security groups), S3 (buckets, policies, versioning), RDS basics. |
| 2 | **AWS networking** | Build a VPC with public and private subnets from scratch; understand why you want private subnets and how NAT gateways work. |
| 3 | **Terraform basics** | Providers, resources, data sources, variables, outputs, the state file, `init`/`plan`/`apply`/`destroy`. |
| 4 | **Terraform structure** | Modules, remote state (S3 backend + DynamoDB locking), workspaces or per-env folders, `.tfvars`. |
| 5 | **Cost + safety hygiene** | Billing alarms, tagging conventions, `terraform plan` reading, how to avoid orphaned resources. |

## Primary Resources (all free)

| Resource | Format | What it covers |
|---|---|---|
| [AWS Skill Builder](https://skillbuilder.aws/) — free courses | Video + quizzes | "AWS Cloud Practitioner Essentials" and "AWS Technical Essentials" are both free and give you the service map. |
| [AWS official documentation](https://docs.aws.amazon.com/) | Reference | Read the "Getting Started" guide for each core service. Don't skip these in favor of YouTube — the docs are genuinely good. |
| [AWS Well-Architected Labs](https://www.wellarchitectedlabs.com/) | Guided labs | Free, hands-on labs written by AWS. Do the Level 100 labs in Security and Cost. |
| [HashiCorp Developer: Terraform Tutorials](https://developer.hashicorp.com/terraform/tutorials) | Guided tutorials | Official, high quality. Start with "Get Started - AWS" and "Configuration Language". |
| [Terraform Registry](https://registry.terraform.io/) | Reference | You'll live here. Learn to read a module's inputs/outputs. |
| [Gruntwork blog — "A Comprehensive Guide to Terraform"](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca) | Article series | Yevgeniy Brikman's series. Free and excellent. |
| [AWS in Plain English / Serverless Land / the AWS Community Builders blog](https://community.aws/) | Articles | Community-written deep dives. Good for "why", not just "how". |
| [freeCodeCamp — AWS Certified Cloud Practitioner (YouTube, full course)](https://www.youtube.com/results?search_query=freecodecamp+aws+certified+cloud+practitioner) | Long-form video | Good survey course if you like video; ~14 hours. |

## Capstone Project — "Two-Tier Web App on AWS, 100% Terraform"

Extend your Phase 1 repo. Using Terraform, provision:

1. A VPC with two public and two private subnets across two AZs, an Internet Gateway, and one NAT Gateway.
2. An Application Load Balancer in the public subnets.
3. An EC2 Auto Scaling Group (2 instances) in the private subnets running a simple static site via `user_data` (or nginx serving an HTML page from S3).
4. An S3 bucket for the Terraform remote state, with a DynamoDB table for state locking — bootstrap this by hand first, then migrate.
5. Billing alarm at $10 via CloudWatch + SNS email.
6. **Tear everything down** with `terraform destroy` and confirm zero resources remain. Document teardown in the README.

Commit state backend config, but *never* commit state files or secrets. Add a `.gitignore` that blocks `*.tfstate*` and `.terraform/`.

## Success Metric

Given an empty AWS account, you can run `terraform apply` and have a working, load-balanced web app reachable on a public URL in under 10 minutes — and then `terraform destroy` it cleanly with nothing left behind. You can explain, unprompted, why the EC2 instances are in private subnets and how traffic reaches them.

---

# Phase 3 — Containers: Docker + Kubernetes (Weeks 11–16)

**Focus:** Package applications portably with Docker, orchestrate them with Kubernetes.
**Why here:** Containers are how modern applications ship. K8s is the de facto standard for running them at scale.

## Key Concepts

| # | Concept | What "knowing it" looks like |
|---|---|---|
| 1 | **Docker fundamentals** | Images vs containers, layers, Dockerfile best practices (small base images, multi-stage builds, non-root users), `docker build/run/exec/logs`. |
| 2 | **Docker Compose** | Define multi-container apps (web + DB + cache) in one YAML; understand networks and volumes. |
| 3 | **Kubernetes core objects** | Pods, Deployments, Services (ClusterIP / NodePort / LoadBalancer), ConfigMaps, Secrets, Namespaces. |
| 4 | **K8s workloads + networking** | Ingress and Ingress Controllers, Persistent Volumes and Claims, StatefulSets for databases, basic RBAC. |
| 5 | **Helm basics** | Charts as K8s package format; `values.yaml` templating; installing a chart from Artifact Hub (e.g., ingress-nginx, cert-manager). |

## Primary Resources (all free)

| Resource | Format | What it covers |
|---|---|---|
| [Docker official "Get Started"](https://docs.docker.com/get-started/) | Official tutorial | Start here. Do all 5 parts. |
| [Play with Docker](https://labs.play-with-docker.com/) | Browser lab | Free ephemeral Docker environment; no install needed. |
| [Docker Curriculum](https://docker-curriculum.com/) — Prakhar Srivastav | Free tutorial site | Friendlier narrative style; good companion to the official docs. |
| [Kubernetes.io tutorials](https://kubernetes.io/docs/tutorials/) | Official | Official "Learn Kubernetes Basics" is the best free starting point. |
| [KillerCoda](https://killercoda.com/) | Free scenarios | Browser-based K8s playgrounds. Spiritual successor to the old Katacoda. Do the Kubernetes beginner track. |
| [TechWorld with Nana — Kubernetes Tutorial for Beginners (YouTube, free, ~4h)](https://www.youtube.com/watch?v=X48VuDVv0do) | Long-form video | Free channel content. Excellent conceptual walkthrough of K8s. |
| [Kubernetes the Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) — Kelsey Hightower | GitHub repo | Only attempt this *after* you're comfortable with the basics. It builds a cluster from scratch and is clarifying. |
| [Helm documentation](https://helm.sh/docs/) | Official | Start with "Quickstart Guide" and "Chart Template Guide". |
| [minikube](https://minikube.sigs.k8s.io/docs/start/) / [kind](https://kind.sigs.k8s.io/) | Local K8s | Pick one for local dev. `kind` is lighter and more scriptable. |

## Capstone Project — "Containerized App on Kubernetes"

Take a simple 2-tier app (a Node.js or Python Flask API + Postgres is a fine choice — or a public sample like `kubernetes/examples/guestbook`):

1. Write a multi-stage `Dockerfile` for the app. Image should run as a non-root user and be under 200MB.
2. Run locally with `docker compose up`: API + Postgres + a volume for DB data.
3. Push the image to a registry — use GitHub Container Registry (free for public images) or Amazon ECR (Phase 2 skills).
4. Write K8s manifests: Deployment (3 replicas), Service, ConfigMap (non-sensitive config), Secret (DB password), a StatefulSet for Postgres with a PVC, and an Ingress.
5. Deploy to a local cluster (`kind` or `minikube`) first, then to an EKS cluster you provision **with Terraform** (extend your Phase 2 code — use the official `terraform-aws-modules/eks/aws` module).
6. Install the ingress-nginx controller via Helm. Confirm you can reach the app from outside the cluster.

## Success Metric

You can take an application you've never seen before, write a clean Dockerfile for it, and deploy it to a Kubernetes cluster — then use `kubectl` to diagnose why a pod is in `CrashLoopBackOff` (logs, describe, events) and explain the root cause.

---

# Phase 4 — CI/CD (Weeks 17–20)

**Focus:** Automate building, testing, and deploying everything from Phases 1–3.
**Why here:** Without CI/CD, everything above is a manual party trick. This is what a DevOps engineer does every day.

## Key Concepts

| # | Concept | What "knowing it" looks like |
|---|---|---|
| 1 | **Pipeline fundamentals** | Stages: lint → test → build → publish → deploy; what should run on every commit vs only on merge to main vs only on a tag. |
| 2 | **GitHub Actions** | Workflows, jobs, steps, runners, `actions/checkout`, matrix builds, caching, reusable workflows, environments with approvals. |
| 3 | **Secrets + OIDC** | Never hardcode creds; use GitHub Secrets for secret values and GitHub → AWS OIDC for short-lived credentials in pipelines. |
| 4 | **Container + IaC pipelines** | Build + scan Docker images (Trivy), publish to a registry with semantic tags; `terraform fmt`/`validate`/`plan` on PRs, `apply` only on main. |
| 5 | **Deployment strategies** | Rolling updates (K8s default), blue/green, canary; rollback mechanics; why you want liveness/readiness probes. |

## Primary Resources (all free)

| Resource | Format | What it covers |
|---|---|---|
| [GitHub Actions documentation](https://docs.github.com/en/actions) | Official | Start with "Quickstart" and "Understanding GitHub Actions". |
| [GitHub Actions Marketplace](https://github.com/marketplace?type=actions) | Reference | Real actions written by real teams — a huge learning resource. |
| [awesome-actions](https://github.com/sdras/awesome-actions) | Curated list | High-signal curated list of Actions and workflows. |
| [GitLab CI/CD docs](https://docs.gitlab.com/ee/ci/) | Official | Even if you use GitHub Actions, skim GitLab's docs — the concepts translate and interview panels ask about both. |
| [Continuous Delivery (YouTube)](https://www.youtube.com/@ContinuousDelivery) — Dave Farley | Videos | Farley literally co-wrote the *Continuous Delivery* book. Watch his "What Is CI/CD?" and anti-pattern videos. |
| [Google's DORA research](https://dora.dev/) | Articles | The definitive research on what separates high- from low-performing engineering orgs. Read "Capabilities" section. |
| [Trivy documentation](https://aquasecurity.github.io/trivy/) | Official | Free container + IaC scanner; standard in the industry. |
| [Configuring OpenID Connect in AWS](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services) | Official guide | How to let GitHub Actions assume an AWS role without long-lived keys. Do this; don't use access keys. |

## Capstone Project — "Ship It Automatically"

Add a `.github/workflows/` directory to your portfolio repo with:

1. **`ci.yml`** on every PR:
   - Lints shell scripts (`shellcheck`), Dockerfiles (`hadolint`), and Terraform (`terraform fmt -check`, `terraform validate`).
   - Runs `terraform plan` against a dev workspace and posts the plan as a PR comment.
   - Builds the Docker image from Phase 3 and runs a Trivy scan; fails on HIGH/CRITICAL CVEs.
2. **`cd.yml`** on merge to `main`:
   - Assumes an AWS role via OIDC (no static keys).
   - Tags the Docker image as `sha-<gitsha>` and `latest`, pushes to ECR.
   - Runs `terraform apply` on a prod workspace.
   - Runs `kubectl set image` (or `helm upgrade`) to roll out the new version.
3. **`release.yml`** on Git tag `v*`:
   - Creates a GitHub Release with an auto-generated changelog.

Add a `CHANGELOG.md` and a branch protection rule requiring CI to pass before merge.

## Success Metric

A commit to `main` in your repo triggers a pipeline that deploys a new version to your Kubernetes cluster without you touching a terminal. If the deployment fails health checks, the pipeline rolls it back automatically. You can read any failed job's logs and identify the root cause within 5 minutes.

---

# Phase 5 — Observability (Weeks 21–24)

**Focus:** Know what's happening in production, and get woken up at the right time.
**Why here:** Code that ships without observability is code you can't support. This is the difference between a junior who can *deploy* and one who can *run* systems.

## Key Concepts

| # | Concept | What "knowing it" looks like |
|---|---|---|
| 1 | **Three pillars** | Metrics, logs, traces — when to use which, and why they're complementary not substitutable. |
| 2 | **Prometheus + Grafana** | Scrape model, PromQL basics (rate, avg_over_time, histogram_quantile), dashboards, alert rules, Alertmanager routing. |
| 3 | **Logging pipeline** | Structured JSON logs, aggregation (Loki or a small ELK), queries; why `kubectl logs` alone doesn't scale. |
| 4 | **SLIs, SLOs, error budgets** | Pick meaningful indicators (latency, error rate, saturation), set realistic objectives, alert on burn rate not thresholds. |
| 5 | **Incident basics** | Runbooks, on-call rotations, blameless postmortems, "what would you check first" mental models. |

## Primary Resources (all free)

| Resource | Format | What it covers |
|---|---|---|
| [Google SRE Books](https://sre.google/books/) | Free online | *Site Reliability Engineering* and *The Site Reliability Workbook*. The monitoring, SLO, and postmortem chapters are essential. |
| [Prometheus documentation](https://prometheus.io/docs/introduction/overview/) | Official | "First steps", PromQL basics, and the best practices section. |
| [Grafana tutorials](https://grafana.com/tutorials/) | Official | Start with "Grafana fundamentals" and "Create your first dashboard". |
| [Grafana Loki docs](https://grafana.com/docs/loki/latest/) | Official | Modern, lightweight log aggregation that pairs with Prometheus-style labels. Simpler to run than ELK for a learning project. |
| [PromLabs PromQL tutorials](https://promlabs.com/promql-cheat-sheet/) | Reference | PromQL cheat sheet + free blog articles. PromQL is genuinely tricky; budget time for it. |
| [kube-prometheus-stack Helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) | GitHub repo | The "batteries-included" way to get Prometheus + Grafana + Alertmanager on K8s. |
| [Awesome Prometheus alerts](https://samber.github.io/awesome-prometheus-alerts/) | Curated list | Hundreds of battle-tested alert rules. Steal liberally. |
| [Google's "Four Golden Signals"](https://sre.google/sre-book/monitoring-distributed-systems/) | Book chapter | Latency, traffic, errors, saturation. If you monitor these, you've covered 80%. |

## Capstone Project — "Fully Observable Deployment"

On your K8s cluster from Phase 3:

1. Install `kube-prometheus-stack` via Helm. Expose Grafana via Ingress (with basic auth).
2. Instrument your Phase 3 app with a `/metrics` endpoint (use the Prometheus client library for your language). Expose request count, error count, and latency histogram.
3. Deploy a `ServiceMonitor` so Prometheus scrapes your app.
4. Build a Grafana dashboard with panels for the four golden signals of your app. Export the dashboard JSON and check it into Git.
5. Ship logs to Loki with Promtail or Grafana Alloy. Show a panel that correlates a latency spike with a corresponding error log line.
6. Write two alert rules:
   - **Page-worthy:** error rate > 5% for 5 minutes.
   - **Ticket-worthy:** pod restart count increasing over an hour.
   Route them through Alertmanager to different receivers (for practice — e.g., a real email and a Slack/Discord webhook).
7. Write a one-page `RUNBOOK.md` for the page-worthy alert: what it means, what to check first, how to mitigate, how to resolve.

## Success Metric

When you open your portfolio's Grafana in a job interview screen-share, you can answer: "How's the app doing right now?" in under 30 seconds, with evidence. When asked "how would you know if it broke?", you can walk through your alert rules and explain why you chose those thresholds.

---

# Weeks 25–26: Consolidation + Interview Prep

Don't start a new topic. Instead:

- **Write it up.** Your README is now the most important file in your portfolio. Include architecture diagrams (draw.io / Excalidraw — both free), a "how to run this locally" section, and a "decisions + trade-offs" section explaining *why* you chose what you chose.
- **Record a demo.** A 5-minute Loom or unlisted YouTube video walking through the whole stack. Recruiters will watch this.
- **Practice explaining.** For each phase, prepare a 2-minute "what I built and why" pitch. Practice out loud.
- **Interview basics.** Work through [this DevOps interview questions list](https://github.com/bregman-arie/devops-exercises) — it's a free, community-maintained GitHub repo with hundreds of questions organized by topic.
- **Apply.** Start applying around week 22–23 — hiring pipelines are slow; you'll be ready by the time anyone gets back to you.

---

## Principles to Hold Onto

1. **Build in public.** One GitHub repo, public, with a meaningful commit history. Recruiters read commit messages.
2. **Document as you go.** If you solved it and didn't write it down, you'll solve it again in 3 weeks. Keep a `NOTES.md` or a personal Obsidian/Logseq vault.
3. **Break things on purpose.** Kill a pod. Delete a route table. `terraform destroy` on a Friday. Recovering is where the real learning happens — and it's safe because it's your sandbox.
4. **Billing alarms, day one.** Every cloud account. $10 threshold. Seriously.
5. **The docs are better than you think.** Before searching a blog, search the official docs. You'll be faster and learn better.
6. **Don't chase tools.** Someone will tell you to learn Pulumi, Flux, Argo, Crossplane, Nomad, OpenTelemetry, eBPF, Cilium, Istio — they're all interesting and none of them belong in your first 6 months. Finish this roadmap first.

---

*Last updated: April 2026. All resources verified free at the time of writing; if a link rots, search the title — the content usually moves, not disappears.*
