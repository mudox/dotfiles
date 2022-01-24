#!/usr/bin/env zsh
set -euo pipefail

dir=~/.tmux/themes

# save old theme name
default_theme=badwolf
old=${$(tmux show -gv @mdx-tmux-theme):-${default_theme}}

# restore on error or cancellation
trap 'echo cancelled' SIGINT

# select
set +e
file=$(\ls -1 "${dir}" | fzf --preview="tmux source ${dir}/{}" --preview-window=0)
file=${file:-$old}

# change (or restore)
tmux source "${dir}/${file}"
