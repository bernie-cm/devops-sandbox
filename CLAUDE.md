# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a DevOps sandbox repository for developing and testing shell scripts and DevOps tooling. The `.gitignore` is Python-oriented, suggesting Python tooling may be added alongside shell scripts.

## Current State

The repo contains `sysreport.sh`, a shell script (in progress) intended to output a one-page system health summary covering: uptime, disk usage, top processes by memory, listening ports, failed login attempts, and recent sudo invocations.

## Running Scripts

```bash
bash sysreport.sh
# or
chmod +x sysreport.sh && ./sysreport.sh
```

## Conventions

- Shell scripts use `.sh` extension and include a comment header describing their purpose.
