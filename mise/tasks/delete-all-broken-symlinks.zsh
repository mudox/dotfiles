#!/usr/bin/env zsh
#MISE description="macos: delete all broken symlinks"

set -euo pipefail

gfind -xtype l -print -delete
