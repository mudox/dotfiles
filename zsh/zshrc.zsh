# vim: filetype=zsh foldmethod=marker

# proxy
source "${HOME}/.config/proxy"

# global env
export -r MDX_GIT_DIR="${HOME}/Git"
export -r MDX_DOT_DIR="${HOME}/.dotfiles"
export -r MDX_NVIM_DIR="${HOME}/Git/neovim-config"
export -r MDX_TMUX_DIR="${HOME}/Git/tmux-config"
export -r MDX_HS_DIR="${HOME}/Git/hs-config"
export -r MDX_DEV_DIR="${HOME}/Develop"

# locale
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# uniquing path lists
typeset -U path
typeset -U fpath

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

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
