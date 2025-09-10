# vim: filetype=zsh

# human friendly numbers
alias df='df -h'
alias du='du -h'

# replace current zsh process
alias ez='exec zsh'

# list options
alias opts='for k v in ${(@kv)options}; do
    printf "%-30s%s\n" $k $v
done | fzf --multi'

# list commands
alias cmds='whence -vm "*" | fzf --multi'

# whence
alias w='whence -asv'
alias wm='w -m'

# typeset
alias t='typeset'
alias tp='typeset -p1'

# print
alias p='print'

# bindkey
alias keys='bindkey | fzf --multi'

# tuist
alias tu='tuist'
alias tg='tuist generate'
alias te='tuist edit'
alias ts='tuist scaffold'
alias tw='tuist cache warm'

# lua
alias lr='luarocks'

# neovim
alias v=nvim
alias e=nvim

# mise
alias m='mise'
alias u='mise use'
alias x='mise exec --'

alias r='mise run'
alias mx='mise run run-task'

alias mt='mise tasks'

alias mw='mise watch'
alias R='mise watch'

alias ml='mise ls'
alias mll='mise ls --local'
alias mlg='mise ls --global'
alias mlr='mise ls-remote'

alias mo='mise outdated'
alias mO='mise outdated --bump'
