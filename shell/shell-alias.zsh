# vim: filetype=zsh

# human friendly numbers
alias df='df -h'
alias du='du -h'

# replace current zsh process
alias ez='exec zsh'

alias opts='for k v in ${(@kv)options}; do
  typeset -L 30 name=$k
  print -- ${name} $v
done | fzf --multi'
