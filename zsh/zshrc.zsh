#  vim: fdm=marker fmr=〈,〉


() {
  local dir=${MDX_DOT_DIR}/zsh
  source "${dir}/zinit.zsh"
  source "${dir}/ohmyzsh.zsh"
  source "${dir}/custom.zsh"
}

# path
path=(~/.bin $path)

# prompt
eval "$(starship init zsh)"

# color
if [[ -n $PS1 ]]; then
  eval "$("${MDX_GIT_DIR}/base16-shell/profile_helper.sh")"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autostart tmux if not already in tmux
if [[ -n $KITTY_WINDOW_ID ]]; then # Only auto start Tmux in Kitty terminal
  if [[ -z "$TMUX" && -z "$INSIDE_EMACS" && -z "$EMACS" && -z "$VIM" ]]; then
    if [[ $TMUX_AUTO_STARTED != true ]]; then
      export TMUX_AUTO_STARTED=true
      tmux
      # auto quit terminal app
      [[ ! -e /tmp/no-zsh-tmux-auto-quit ]] && exit
    fi
  fi
fi

#  vim: fdm=marker fmr=〈,〉
