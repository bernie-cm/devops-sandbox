#!/bin/bash
set -euo pipefail
# sysreport.sh - A script to produce a one page health summary
# Output one page system health summary
title="System Information for"
RIGHT_NOW="$(date +"%x %r %Z")"
TIMESTAMP="Updated on $RIGHT_NOW by $USER"
echo "System Heatlh Summary"
echo $title $HOSTNAME

# Write time stamp when the script was executed
echo $TIMESTAMP
# Write uptime
echo "=== UPTIME ==="
echo "The system has been running since"
uptime

# Write disk space
echo "=== DISK USAGE ==="
echo "The filesystem is using this much disk space"
df -h --total
# Write home space
#
# Write top 5 processes by memory
#
# Write listening ports
#
# Write failed login attempts
#
# Write last 10 sudo invocations
#
