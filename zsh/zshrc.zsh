#  vim: fdm=marker fmr=〈,〉

# NOTE: already let kitty to launch /Users/mudox/.bin/tmux immediately in `kitty.conf`
# tmux
# if [[ -n $KITTY_WINDOW_ID ]]; then # Only auto start Tmux in Kitty terminal
#   if [[ -z "$TMUX" && -z "$INSIDE_EMACS" && -z "$EMACS" && -z "$VIM" ]]; then
#     if [[ $TMUX_AUTO_STARTED != true ]]; then
#       export TMUX_AUTO_STARTED=true
# 			export PATH="${HOME}/.bin:${PATH}"
#       exec tmux
#     fi
#   fi
# fi

# configs
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
