#!/usr/bin/env zsh
set -euo pipefail

session_name='Dotfiles'
window_name='Ap-Actions'
window="${session_name}:${window_name}"

if tmux has-session -t "${window}" >/dev/null 2>&1; then
  tmux switch-client -t "${window}"
	exit 0
fi

source ${MDX_TMUX_DIR}/sessions/lib/utils.zsh

local pane_title='  Edit'
local dir="${MDX_DOT_DIR}/ap"
local cmd="nvim"
window

tmux switch-client -t "${window}"
