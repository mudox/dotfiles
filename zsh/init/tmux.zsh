# Envs
export TMUX_AUTOQUIT=true

tksv() {
  if [[ -n $TMUX ]]; then
    tmux detach-client
  fi
  tmux kill-server
}

# Aliases
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tkss='tmux kill-session -t'

# Key bindings
bindkey -r '^L'
bindkey -r '^[^L'
bindkey '^[l' clear-screen
