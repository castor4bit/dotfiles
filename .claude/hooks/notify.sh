#!/bin/bash
# Claude Code notification script
# Usage: notify.sh <event>
# Events: stop, permission, idle

input=$(cat)
EVENT="$1"
DIR=$(echo "$input" | jq -r '.cwd // "."' | xargs basename)

# Bundle ID of the terminal to focus when the notification is clicked.
ACTIVATE_BUNDLE_ID="com.mitchellh.ghostty"

# If running inside tmux, capture the target window so the click handler
# can switch back to it. terminal-notifier's -execute runs with a minimal
# PATH and no TMUX env var, so we embed the absolute tmux binary path and
# server socket explicitly.
CLICK_EXECUTE=""
if [ -n "$TMUX" ]; then
  TMUX_BIN=$(command -v tmux)
  TMUX_SOCKET=${TMUX%%,*}
  TMUX_TARGET=$(tmux display-message -p -t "$TMUX_PANE" -F '#{session_name}:#{window_index}' 2>/dev/null)
  if [ -n "$TMUX_BIN" ] && [ -n "$TMUX_SOCKET" ] && [ -n "$TMUX_TARGET" ]; then
    CLICK_EXECUTE="open -a Ghostty && '$TMUX_BIN' -S '$TMUX_SOCKET' select-window -t '$TMUX_TARGET'"
  fi
fi

notify() {
  local message="$1" sound="$2"
  printf '\a' >/dev/tty 2>/dev/null

  local args=(
    -title "Claude Code"
    -message "$DIR: $message"
    -sound "$sound"
    -group "claude-code-$$-$(date +%s%N)"
  )
  if [ -n "$CLICK_EXECUTE" ]; then
    args+=(-execute "$CLICK_EXECUTE")
  else
    args+=(-activate "$ACTIVATE_BUNDLE_ID")
  fi

  terminal-notifier "${args[@]}" >/dev/null 2>&1
}

case "$EVENT" in
  idle)      notify "Waiting for input" "Glass" ;;
  stop)      notify "Done" "Hero" ;;
  permission) notify "Permission needed" "Ping" ;;
esac
