#!/usr/bin/env zsh

gw() {
  pwd=$PWD

  typeset -A repos
  repos=(
    'Dotfiles' "${HOME}/.dotfiles"
    'Neovim' "${HOME}/Git/neovim-config"
    'Hammerspoon' "${HOME}/Git/hs-config"
  )

  for k in "${(@k)repos}"; do
    local n="$k"
    local p="$repos[$k]"

    cd "$p"
    local output=$(git status --short)

    if [[ -n $output ]]; then
      echo "[$n]"
      git status --short
      echo
    fi
  done

  cd "$pwd"
}