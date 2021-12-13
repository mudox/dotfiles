bindkey -r '^L'
bindkey -r '^[^L'
bindkey '^[l' clear-screen

# auto start tmux when open a new terminal app window
export ZSH_TMUX_AUTOSTART=true

# fix: zinit snippet does not download dependence files (tmux.extra.conf)
# `default-terminal` is already set in my .tmux.conf
export ZSH_TMUX_FIXTERM=false
