#!/usr/bin/env zsh
set -euo pipefail
# set -x

TAR="nvim-macos.tar.gz"
URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz"
BAK="nvim-nightly-backup/$(date '+%Y-%m-%d')"

cd ~/.bin

# downlaod
wget "$URL" -q --show-progress

# extract
tar xzf "$TAR"

# backup old version
set +e
rm "$TAR"
mkdir nvim-nightly-backup &>/dev/null
if [[ ! -d $BAK ]]; then
    mv nvim-nightly "$BAK"
fi
set e

# install
mv nvim-macos nvim-nightly && nvim -V1 -v
