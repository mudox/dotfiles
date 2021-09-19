#!/usr/bin/env zsh

set -eo pipefail

cargo doc
file=$(fd --color=always 'index.html' target/doc | fzf --ansi --header='Open Crate Doc' --query="$1")
[[ -f $file ]] && open "$file"
