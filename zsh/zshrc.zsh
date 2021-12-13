# vim: filetype=zsh foldmethod=marker

# proxy
source "${HOME}/.config/proxy"

# profile zsh launch
alias pz='MDX_PROFILE_ZSH=yes zsh -i -c exit'

if [[ $MDX_PROFILE_ZSH = yes ]]; then
  zmodload zsh/zprof
fi

# global env
export -r MDX_GIT_DIR="${HOME}/Git"
export -r MDX_DOT_DIR="${HOME}/.dotfiles"
export -r MDX_NVIM_DIR="${HOME}/Git/neovim-config"
export -r MDX_TMUX_DIR="${HOME}/Git/tmux-config"
export -r MDX_HS_DIR="${HOME}/Git/hs-config"

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

# profile
if [[ $MDX_PROFILE_ZSH = yes ]]; then
  zprof
  unset MDX_PROFILE_ZSH
fi
