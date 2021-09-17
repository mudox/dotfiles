#!/usr/bin/env bash

source ~/.dotfiles/scripts/lib/jack.zsh

# executable availability check
if [[ -z "$(type hugo)" ]]; then
  printf "\e[31mmissing executable hugo..., quit\e[0m\n"
  return
fi

# Shell function: hb - Build and sync my personal site

hb() {

  setopt -o rm_star_silent
  trap 'setopt +o rm_star_silent' EXIT

  # Source path
  local src_path="${HOME}/Sites/home"
  if [ ! -d "${src_path}" ]; then
    jackError "missing ${src_path} as source repo, quit ..."
    return
  fi

  # Build path
  local build_path="${src_path}/build/publish"
  cd "${src_path}"

  # Destination path
  local dest_path="${HOME}/Sites/mudox.github.io"
  if [ ! -d "${dest_path}" ]; then
    jackError "missing ${dest_path} as destination repo, quit ..."
    return
  fi

  # Build site
  jackNote "\nStart building site ..."

  rm -rf "${build_path}" &>/dev/null # remove public directory first.

  hugo \
    --source=${src_path} \
    --destination="${build_path}" \
    --buildDrafts

  # Check hugo buiding result
  if (($? != 0)); then
    jackError "build site failed, quit"
    return
  fi

  # Install into desitination path
  jackNote "\nInstalling production ..."
  rm -rf "${dest_path}"/* &>/dev/null # Clear the directory up first
  cp -rT "${build_path}" "${dest_path}"

  if (($? != 0)); then
    jackError "copying failed, quit"
    return
  fi

  # Depoly to github
  jackNote "\nSyncing <${dest_path##*/}>"
  cd "${dest_path}"
  git add --all . &>/dev/null
  git commit -m "${*:-Cumulative update}"
  git push

  # Sync hugo source repo
  jackNote "\nSyncing <${src_path##*/}>"
  cd "${src_path}"
  git add --all . &>/dev/null
  git commit -m "${*:-Cumulative update}"
  git push

  terminal-notifier -message 'Homepage site synced' -title 'Hugo' -execute 'open -a "Google Chrome" "http://mudox.github.io"'
}

# Shell function: hs - Start Hugo server to monitor your site sources and
# re-build automatically on any change.

hs() {
  local ipaddr=$(ipconfig getifaddr en0)
  hugo server \
    --buildDrafts --buildExpired --buildFuture \
    --gc --cleanDestinationDir \
    --bind="${ipaddr}" \
    --baseURL="${ipaddr}"
}
