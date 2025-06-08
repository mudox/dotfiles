if [[ ! -o interactive ]]; then
  return
fi

if [[ -n $DID_INIT_ZOXIDE ]]; then
  return
fi
export DID_INIT_ZOXIDE=1

export _ZO_ECHO=1
eval "$(zoxide init --cmd j zsh)"

# alt+j to jump by zoxide
_zi_widget() {
  ji
  zle accept-line
}
zle -N _zi_widget
bindkey "^[j" _zi_widget
