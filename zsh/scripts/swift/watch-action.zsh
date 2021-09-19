#!/usr/bin/env zsh

clear

typeset -A actions
actions=(
  b build
  r run
  t test
)

echo "Start ${actions[$1]}ing ...\n"
swift "${actions[$1]}"
