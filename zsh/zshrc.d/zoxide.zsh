if [[ ! -o interactive ]]; then
  return
fi

export _ZO_ECHO=1
eval "$(zoxide init zsh)"

# alt+j to jump by zoxide
_zi_widget() {
  ji
  zle accept-line
}
zle -N _zi_widget
bindkey "^[j" _zi_widget
