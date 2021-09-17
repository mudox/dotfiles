#!/usr/bin/env zsh

if [[ $# -ne 1 || ! $1 =~ [brt] ]]; then
  echo "Usage: $0 [b|r|t]"
  exit 1
fi

fswatch -0or ./Sources ./Tests | xargs -0 -n1 -I{} "$MDX_DOT_DIR/scripts/swift/watch-action.zsh" $1
