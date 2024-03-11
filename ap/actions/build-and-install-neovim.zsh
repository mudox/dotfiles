#!/usr/bin/env zsh
set -eu pipefail

INSTALL_PREFIX="${HOME}/.bin/nvim-compiled"

cd ~/Git/neovim

print -n -- 'Git pull? '
if read -t 2 -q; then
    git pull
fi

# jack info -b 1 'Install buidling dependencies'
# brew install ninja libtool automake cmake pkg-config gettext curl

jack info -b 2 'Build Neovim'
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}" CMAKE_BUILD_TYPE="Release"

jack info -b 2 "Install Neovim to ${INSTALL_PREFIX}"
# Backup
if [[ -d ${INSTALL_PREFIX} ]]; then
    mv -v "${INSTALL_PREFIX}" "${INSTALL_PREFIX}-backup"
fi
make install
