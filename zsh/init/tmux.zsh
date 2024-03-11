# Envs
export TMUX_AUTOQUIT=true

# Aliases
alias ta='tmux attach -t'

tksv() {
  if [[ -n $TMUX ]]; then
    tmux detach-client
  fi
  tmux kill-server
}

tl() {
	tmux list-panes -a -F '#S:#W.#P with #{pane_current_command}'
}

tkss() {
	before="$(tl)"
	tmux kill-session -t "$@"
	after="$(tl)"
	BAT_STYLE='plain' batdiff <(echo "$before") <(echo "$after")
}

alias trp='tmux respawn-pane -k -c .'
 
# Key bindings
bindkey -r '^L'
bindkey -r '^[^L'
bindkey '^[l' clear-screen
