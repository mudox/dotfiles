#!/usr/bin/env zsh
set -euo pipefail

git push github &
git push gitee &
wait

print -n -- 'Open repo pages? '
if read -t 2 -q; then
  open "$(git config remote.github.url)" &
  open "$(git config remote.gitee.url)" &
fi
