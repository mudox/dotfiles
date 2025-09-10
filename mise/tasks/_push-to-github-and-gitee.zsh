#!/usr/bin/env zsh
set -euo pipefail

git push github &
git push gitee &
wait
