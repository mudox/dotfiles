#!/usr/bin/env zsh
set -euo pipefail

session_name='Default'
window_name='Ubersicht'
window="${session_name}:${window_name}"

if tmux has-session -t "${window}" >/dev/null 2>&1; then
  tmux switch-client -t "${window}"
	exit 0
fi

source ${MDX_TMUX_DIR}/sessions/lib/utils.zsh

local pane_title='  Ubersicht'
local dir=~/Library/Application\ Support/Übersicht
window

tmux switch-client -t "${window}"
