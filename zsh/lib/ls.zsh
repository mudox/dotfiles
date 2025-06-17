export EZA_ICON_SPACING=2

# use `eza` instead of `ls`
alias l="eza --classify --group-directories-first"
alias ls=l
alias tree='l --tree'
alias l1='l --oneline'
alias ll='l --long --header --modified --time-style=long-iso --git'
alias la='ll --all --all'

# tree
alias lt='ll --tree'
alias lta='ll --tree --all'
alias t3='tree -L3'
alias t3a='tree -L3 --all'
alias t3d='tree -L3 --only-dirs'
