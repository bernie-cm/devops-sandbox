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
  local count="${1:-5}"
  echo "=== Top $count processes by memory ==="
  ps aux --sort=-%mem | head -n $((count + 1))
}

function listening_ports {
  echo "=== Listening ports ==="
  ss -tlnp
}
function show_failed_logins {
  echo "=== Failed login attempts ==="
  grep "Failed password" /var/log/auth.log 2>/dev/null | tail -5 || echo "No failed login attempts found"
}

function last_sudo_invocations {
  # Use $1 to pass the number of sudo invocations desired
  local count="${1:-10}"
  echo "=== Last $count sudo invocations ==="
  grep "sudo:" /var/log/auth.log 2>/dev/null | tail -n "$count" || echo "No sudo invocations found"
}

##### Main
echo "System Health Summary"
echo "$TITLE" "$HOSTNAME"

# Write time stamp when the script was executed
echo "$TIMESTAMP"
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
