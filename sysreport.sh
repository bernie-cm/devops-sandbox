#!/bin/bash
set -euo pipefail
# Output one page system health summary
# uptime
echo "=== UPTIME ==="
echo "The system has been running since"
uptime
#
# disk usage
echo "=== DISK USAGE ==="
echo "The filesystem is using this much disk space"
df -h --total
#
# top 5 processes by memory
#
# listening ports
#
# failed login attempts
#
# last 10 sudo invocations
