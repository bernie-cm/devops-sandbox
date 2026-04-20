#!/bin/bash
set -euo pipefail
# sysreport.sh - A script to produce a one page health summary
##### CONSTANTS

TITLE="System Information for"
RIGHT_NOW="$(date +"%x %r %Z")"
TIMESTAMP="Updated on $RIGHT_NOW by $USER"

##### Functions
function (show_uptime) {

}

function (drive_space) {

}

function (home_space) {

}

function (top_processes_memory(n)) {

}

function (listening_ports) {

}
function (show_failed_logins) {

}

function (last_sudo_invocations(n)) {

}

##### Main
echo "System Heatlh Summary"
echo $TITLE $HOSTNAME

# Write time stamp when the script was executed
echo $TIMESTAMP
$(show_uptime)
# Write uptime
echo "=== UPTIME ==="
echo "The system has been running since"
uptime

# Write disk space
$(drive_space)
echo "=== DISK USAGE ==="
echo "The filesystem is using this much disk space"
df -h --total
# Write home space
$(home_space)
#
# Write top 5 processes by memory
$(top_processes_memory(5))

# Write listening ports
$(listening_ports)

# Write failed login attempts
$(show_failed_logins)

# Write last 10 sudo invocations
$(last_sudo_invocations(10))
