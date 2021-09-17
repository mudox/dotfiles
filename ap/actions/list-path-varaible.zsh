#!/usr/bin/env zsh

dir=$(for p in ${path}; do
  print -- $p
done | fzf)

if [[ -d $dir ]]; then
  cd $dir
  exec zsh
fi
