#!/usr/bin/env zsh
set -euo pipefail

fswatch -0or -l 0.5 \
  -E -e '__pycache__' -e '\.py\.[^.]+\.py' \
  src tests .ap-actions/tmux-watch.zsh |
  xargs -0 -n1 -I{} "${MDX_DOT_DIR}/zsh/scripts/python/watch-action.zsh"
