#!/bin/bash
# Claude Code notification script
# Usage: notify.sh <event>
# Events: stop, permission, idle

input=$(cat)
EVENT="$1"
DIR=$(echo "$input" | jq -r '.cwd // "."' | xargs basename)

notify() {
  local message="$1" sound="$2"
  printf '\a' >/dev/tty 2>/dev/null
  osascript -e "display notification \"$DIR: $message\" with title \"Claude Code\"" 2>/dev/null
  afplay "/System/Library/Sounds/${sound}.aiff" 2>/dev/null &
}

case "$EVENT" in
  idle)      notify "Waiting for input" "Glass" ;;
  stop)      notify "Done" "Hero" ;;
  permission) notify "Permission needed" "Ping" ;;
esac
