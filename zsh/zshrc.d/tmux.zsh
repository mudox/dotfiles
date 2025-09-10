# Envs
export MDX_TMUX_AUTOQUIT=true

# Aliases
alias ta='tmux attach -t'
alias trp='tmux respawn-pane -k -c .'
alias trv='tmux respawn-pane -k -c . nvim'

tksv() {
  if [[ -n $TMUX ]]; then
    tmux detach-client
  fi
  tmux kill-server
}

tl() {
  tmux list-panes -a -F '#S:#W:#{pane_current_command}' | (
    local -A sessions windows
    while IFS=':' read -r session window cmd; do
      if [[ -z $sessions[$session] ]]; then
        echo "$session"
        sessions[$session]=1
        windows=()
      fi
      if [[ -z $windows[$window] ]]; then
        echo "   $window"
        windows[$window]=1
      fi
      echo "      󰞷  $cmd"
    done
  )
}
