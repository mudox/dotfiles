#!/usr/bin/env zsh
set -euo pipefail

src_dir=/opt/homebrew/Cellar/neovim

backup_dir=~/.local/share/nvim/neovim_cellar_backup
version=$(/opt/homebrew/bin/nvim --version | head -n1 | awk '{print $2}')
dst_dir="${backup_dir}/${version}"

jack info 'Backup old version'
if [[ -d ${dst_dir} ]]; then
	jack error "Destination directory ${dst_dir} already exists, skip"
else
	print -- "to: ${dst_dir}"
	cp -a "${src_dir}" "${dst_dir}"
fi

jack info 'Upgrade Neovim HEAD'

brew upgrade --fetch-head neovim
