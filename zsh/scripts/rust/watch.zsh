#!/usr/bin/env zsh
set -euo pipefail

fswatch -0or -l 0.5 src tests .ap-actions/tmux-watch.{zsh,toml} | 
  xargs -0 -n1 -I{} "${MDX_DOT_DIR}/zsh/scripts/rust/watch-action.zsh"
