#!/usr/bin/env zsh

for k v in ${(@kv)options}; do
  typeset -L 30 name=$k
  print -- ${name} $v
done | fzf --multi
