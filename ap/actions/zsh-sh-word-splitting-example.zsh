#!/usr/bin/env zsh
set -euo pipefail

cnt() {
  if [[ $# -eq 1 ]]; then
    echo x
  else
    echo splitted
  fi
}

tt() {
  setopt no_sh_word_split
  x=$(eval "cnt $1")

  setopt sh_word_split
  y=$(eval "cnt $1")

  printf '%12s%14s%14s\n' $1 $x $y
}

t() {
  jack info -b1 '一般变量（字符串）'
  a='1 2 3'
  typeset -p a

  printf '\n%12s%14s%14s\n\n' syntax 'no split' 'split'
  tt '$a'
  tt '"$a"'
  tt '${a[*]}'
  tt '${a[@]}'
  tt '"${a[*]}"'
  tt '"${a[@]}"'

  echo '
  字符串变量在 NO_SH_WORD_SPLIT (zsh 默认) 下，任何语法都不会发生 word splitting
  开启 SH_WORD_SPLIT 后，只要不被双引号括起来就会被 split
  '

  jack info -b1 '数组'
  a=(1 2 3)
  typeset -p a

  printf '\n%12s%14s%14s\n\n' syntax 'no split' 'split'
  tt '$a'
  tt '"$a"'
  tt '${a[*]}'
  tt '${a[@]}'
  tt '"${a[*]}"'
  tt '"${a[@]}"'

  echo '
  数组的 word splitting 不受 SH_WORD_SPLIT 选项的影响，只有在 `"$a"` 和 `"${a[*]}"` 两种
  语法下会抑制 word splitting
  数组是倾向于（易于）word splitting 的，需要 splitting 的场景，建议使用数组
  '
}

t
