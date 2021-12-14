# Envs
export TMUX_AUTOQUIT=true

# Aliases
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# Key bindings
bindkey -r '^L'
bindkey -r '^[^L'
bindkey '^[l' clear-screen
