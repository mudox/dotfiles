#!/usr/bin/env zsh
set -euo pipefail

if [[ -f Gemfile ]]; then
  exec bundle exec fastlane "$@"
else
  exec fastlane "$@"
fi
