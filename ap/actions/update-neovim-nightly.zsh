#!/usr/bin/env zsh
set -euo pipefail
# set -x

TAR="nvim-macos-arm64.tar.gz"
URL="https://github.com/neovim/neovim/releases/download/nightly/$TAR"
BAK="nvim-nightly-backup/$(date '+%Y-%m-%d')"

cd ~/.bin
rm "$TAR" &>/dev/null

# downlaod
wget "$URL" --show-progress --verbose

# extract
xattr -c "$TAR"
tar xzvf "$TAR"

# backup old version
set +e
rm "$TAR"
mkdir nvim-nightly-backup &>/dev/null
if [[ ! -d $BAK ]]; then
	mv nvim-nightly "$BAK"
fi
set -e

# install
mv "${TAR%.tar.gz}" nvim-nightly && nvim -V1 -v
