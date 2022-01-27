#!/usr/bin/env zsh
set -euo pipefail

session_name=$(tmux display-message -p '#{session_name}')
theme_name=$(tmux show-option -gv @mdx-tmux-theme)

cd "${MDX_TMUX_DIR}/scripts/session-themes"
ln -vsf ../../themes/"${theme_name}" "${session_name}"
