#!/usr/bin/env zsh
set -euo pipefail

source ~/.dotfiles/scripts/lib/jack.zsh

dir="${HOME}/Library/Developer/Xcode/DerivedData"

dir_size() {
  echo $(du -sh "${dir}" | cut -f1)
}

rm_dir() {
  jackProgress $'Delete ...'
  #rm -rf "${dir}"
  sleep 3
  jackInfo 'Done'
}

jackProgress 'Caculating size ...'
size=$(dir_size)
jackEndProgress

while true; do
  read -p "Delete '${dir}' (${size}) [y/n]? " -n1 -r yn
  case $yn in
  [Yy]*)
    rm_dir
    exit
    ;;
  [Nn]*)
    jackInfo $'\nCanceled'
    exit
    ;;
  *) echo "Please tap 'y' or 'n'" ;;
  esac
done
