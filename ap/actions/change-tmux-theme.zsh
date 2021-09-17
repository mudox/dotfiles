#!/usr/bin/env zsh
set -euo pipefail

dir=~/.tmux/tmuxline-files

# sav old theme name
default=badwolf
old=${$(tmux show -gv @mdx-tmux-theme):-${default}}

# select
file=$(\ls -1 "${dir}" | fzf --preview="tmux source $dir/{}" --preview-window=0)
file=${file:-$old}

# change (or restore)
ret=$(tmux source "${dir}/${file}")

