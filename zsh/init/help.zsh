# vim: filetype=zsh

# use `nvim` as man pager
export MANPAGER='MDX_NVIM_MODE=man nvim +Man!'

# zsh `run-help`
unalias run-help
autoload -Uz run-help
