#!/usr/bin/env zsh

if [[ "$(defaults read com.apple.Finder AppleShowAllFiles)" == "NO" ]]; then
  defaults write com.apple.Finder AppleShowAllFiles true
else
  defaults write com.apple.Finder AppleShowAllFiles false
fi
