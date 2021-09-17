#!/usr/bin/env zsh
set -euo pipefail

jack info 'Pushing to [github] & [gitee] ...'
git push github & git push gitee & wait

jack info 'Open in browser ...'
open "$(git config remote.github.url)"
open "$(git config remote.gitee.url)"
