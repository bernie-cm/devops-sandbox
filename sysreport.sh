#!/bin/bash
set -euo pipefail
# sysreport.sh - A script to produce a one page health summary
##### CONSTANTS

TITLE="System Information for"
RIGHT_NOW="$(date +"%x %r %Z")"
TIMESTAMP="Updated on $RIGHT_NOW by $USER"

##### Functions
function show_uptime {
  echo "=== System uptime ==="
  uptime
}

function drive_space {
  echo "=== Filesystem space ==="
  df
}

function top_processes_memory {
  # Use $1 to pass the number of top processes
  echo "function top_processes_memory"
}

function listening_ports {
  echo "function listening_ports"
}
function show_failed_logins {
  echo "function show_failed_logins"
}

function last_sudo_invocations {
  # Use $1 to pass the number of sudo invocations desired
  echo "function last_sudo_invocations"
}

##### Main
echo "System Heatlh Summary"
echo $TITLE $HOSTNAME

# Write time stamp when the script was executed
echo $TIMESTAMP
# Write uptime
show_uptime
# Write disk space
drive_space
#
# Write top 5 processes by memory
top_processes_memory 5

# Write listening ports
listening_ports

# Write failed login attempts
show_failed_logins

# Write last 10 sudo invocations
last_sudo_invocations 10
