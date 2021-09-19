#!/usr/bin/env zsh
set -euo pipefail

dir="${HOME}/Library/Developer/Xcode/DerivedData"

dir_size() {
  echo $(du -sh "${dir}" | cut -f1)
}

rm_dir() {
  jack progress $'Delete ...'
  #rm -rf "${dir}"
  sleep 3
  jack info 'Done'
}

jack progress 'Caculating size ...'
size=$(dir_size)
jack endProgress

while true; do
  read -p "Delete '${dir}' (${size}) [y/n]? " -n1 -r yn
  case $yn in
  [Yy]*)
    rm_dir
    exit
    ;;
  [Nn]*)
    jack info $'\nCanceled'
    exit
    ;;
  *) echo "Please tap 'y' or 'n'" ;;
  esac
done
