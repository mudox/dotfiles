#!/bin/sh

set -eo pipefail

bin="${HOME}/Git/tmux/tmux"
# bin="/opt/homebrew/bin/tmux"

server=default

if [[ -n $ITERM_SESSION_ID ]]; then
    server=iterm
elif [[ -n $KITTY_WINDOW_ID ]]; then
    server=kitty
elif [[ -n $ALACRITTY_LOG ]]; then
    server=alacritty
elif [[ -n $HYPER ]]; then
    server=hyper
fi

if [[ $1 = which-server ]]; then
    echo "${server}"
else
    exec "$bin" -L "${server}" "$@"
fi
