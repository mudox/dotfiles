#!/usr/bin/env zsh
#MISE description="macos: replace application icons"
set -euo pipefail

# Kitty
jack info Kitty
cp -av ~/Git/kitty-icon/kitty-dark.icns /Applications/Kitty.app/Contents/Resources/kitty.icns
touch /Applications/Kitty.app

# Alacritty
jack info Alacritty
cp -av ~/Git/kitty-icon/kitty-light.icns /Applications/Alacritty.app/Contents/Resources/alacritty.icns
touch /Applications/Alacritty.app

# Apply
rm /var/folders/*/*/*/com.apple.dock.iconcache
killall Dock
