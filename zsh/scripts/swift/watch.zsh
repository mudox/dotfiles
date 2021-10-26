#!/usr/bin/env zsh
set -euo pipefail

fswatch -0or -l 0.5 \
  Sources Tests .ap-actions/tmux-watch.{zsh,toml} |
  xargs -0 -n1 -I{} "${MDX_DOT_DIR}/zsh/scripts/swift/watch-action.zsh"
