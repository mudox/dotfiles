#!/usr/bin/env zsh
#MISE description="zsh: list all options"

for k v in ${(@kv)options}; do
  typeset -L 30 name=$k
  print -- ${name} $v
done | fzf --multi
