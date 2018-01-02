# Based on https://github.com/ssh0/dotfiles/blob/master/zshfiles/functions/tmux.zsh

tmux-new-session() {
  if [[ -n $TMUX ]]; then
    tmux switch-client -t "$(TMUX= tmux -S "${TMUX%,*,*}" new-session -dP "$@")"
  else
    tmux new-session "$@"
  fi
}

tmux_sessions() {
  # Select existing session or create session with fuzzy search tool
  # get the IDs
  if ! ID="$(tmux list-sessions 2>/dev/null)"; then
    # tmux returned error, so try cleaning up /tmp
    /bin/rm -rf /tmp/tmux*
  fi
  create_new_session="-"
  if [[ -n "$ID" ]]; then
    ID="${create_new_session}: create new session\n$ID"
  else
    ID="${create_new_session}: create new session"
  fi
  ID="$(echo $ID | peco | cut -d: -f1)"
  echo $ID
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux-new-session
  elif [[ -n "$ID" ]]; then
    if [[ -n $TMUX ]]; then
      tmux switch-client -t "$ID"
    else
      tmux attach-session -t "$ID"
    fi
  else
    :  # Start terminal normally
  fi
}

if [[ ! -n $TMUX && $- == *l* ]]; then
  tmux_sessions
fi
