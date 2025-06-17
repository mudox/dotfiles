# vim: filetype=zsh

# use `nvim` as man pager
export MANPAGER='NVIM_APPNAME=nvim_man nvim +Man!'

# zsh `run-help`
unalias run-help
autoload -Uz run-help
