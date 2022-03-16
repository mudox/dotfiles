#!/usr/bin/env zsh
set -euo pipefail

action="$(print -l -- .ap-actions/watch-*.zsh | fzf)"

if [[ -f $action ]]; then
	ln -vsf "${action:t}" .ap-actions/default-watch-action.zsh
	ln -vsf "${action:t:r}.toml" .ap-actions/default-watch-action.toml
fi
