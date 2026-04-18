#!/bin/bash
# Output one page system health summary
# uptime
echo "The system has been running since"
uptime
#
# disk usage
echo "The filesystem is using this much disk space"
df -hc
#
# top 5 processes by memory
#
# listening ports
#
# failed login attempts
#
# last 10 sudo invocations
