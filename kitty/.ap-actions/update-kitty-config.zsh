#!/usr/bin/env zsh

jack info 'Downloading latest version ...'

tmpfile=/tmp/kitty-sample.conf

curl -sSL https://sw.kovidgoyal.net/kitty/_downloads/433dadebd0bf504f8b008985378086ce/kitty.conf -o "${tmpfile}" && nvim -d "${MDX_DOT_DIR}/kitty/kitty.conf" "${tmpfile}"
