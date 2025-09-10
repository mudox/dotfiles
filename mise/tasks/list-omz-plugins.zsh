#!/usr/bin/env zsh
#MISE description="zsh: list all oh-my-zsh plugins"

args=(
  --prompt="Select OMZ plugin > "
)

args+=(
  --bind 'enter:execute(glow --pager $ZSH/plugins/{}/README.md)'
)

false &&
  args+=(--preview 'CLICOLOR_FORCE=1 glow --style dark $ZSH/plugins/{}/README.md') ||
  args+=(--preview 'bat -pp --color=always --wrap=character $ZSH/plugins/{}/README.md')

source $ZSH/lib/cli.zsh
omz plugin list | grep -v "''" | fzf $args
