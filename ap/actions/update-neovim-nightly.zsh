#!/usr/bin/env zsh
set -euo pipefail
# set -x

TAR="nvim-macos-arm64.tar.gz"
URL="https://github.com/neovim/neovim/releases/download/nightly/$TAR"
BAK="nvim-nightly-backup/$(date '+%Y-%m-%d')"

# clean
cd ~/.bin
set +e
rm "$TAR" &>/dev/null
set -e

# downlaod
wget "$URL" --show-progress --verbose

# extract
xattr -c "$TAR"
tar xzf "$TAR"

# backup old version
set +e
rm "$TAR"
mkdir nvim-nightly-backup &>/dev/null
if [[ ! -d $BAK ]]; then
	mv nvim-nightly "$BAK"
fi
set -e

# install
mv "${TAR%.tar.gz}" nvim-nightly && ./nvim-nightly/bin/nvim -V1 -v
