#!/usr/bin/env nu
#MISE description="nushell: help"

def main [] {
  $env.FZF_DEFAULT_OPTS = '
  --preview-window=border-none
  --no-scrollbar
  --height=~50%
  --reverse
  --info=inline
  '

  help commands
  | get name
  | append [commands aliases modules operators escapes pipe-and-redirect]
  | sort
  | to text
  | fzf --preview "nu -c 'help {r}'" --preview-window=right:70% --bind 'enter:execute(nu -c "help {r} | bat --paging=always")'
}
