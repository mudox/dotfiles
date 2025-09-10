#!/usr/bin/env zsh
#MISE description='macos: refresh icon cache'

rm /var/folders/*/*/*/com.apple.dock.iconcache
killall Dock
