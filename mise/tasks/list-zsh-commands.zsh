#!/usr/bin/env zsh
#MISE description="zsh: list all commands"

whence -vm '*' | fzf --multi
