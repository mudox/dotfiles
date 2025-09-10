#!/usr/bin/env zsh
#MISE description="finder: toggle hidden files"

if [[ "$(defaults read com.apple.Finder AppleShowAllFiles)" == "NO" ]]; then
  defaults write com.apple.Finder AppleShowAllFiles true
else
  defaults write com.apple.Finder AppleShowAllFiles false
fi
