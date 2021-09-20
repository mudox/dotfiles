# vim: filetype=zsh foldmethod=marker

# profile zsh launch
alias pz='MDX_PROFILE_ZSH=yes zsh -i -c exit'

if [[ $MDX_PROFILE_ZSH = yes ]]; then
  zmodload zsh/zprof
fi

# env
export -r MDX_GIT_DIR="${HOME}/Git"
export -r MDX_DOT_DIR="${HOME}/.dotfiles"
export -r MDX_NVIM_DIR="${HOME}/Git/neovim-config"
export -r MDX_TMUX_DIR="${HOME}/Git/tmux-config"
export -r MDX_HS_DIR="${HOME}/Git/hs-config"

# locale
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

typeset -U path

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

() {
  local config_dir=${MDX_DOT_DIR}/zsh
  source "${config_dir}/zinit.zsh"
  source "${config_dir}/ohmyzsh.zsh"
  source "${config_dir}/custom.zsh"
}

# path
path=(~/.bin $path)
# prompt
eval "$(starship init zsh)"

# color
if [[ -n $PS1 ]]; then
  eval "$("$HOME/Git/base16-shell/profile_helper.sh")"
fi

# proxy
source "${HOME}/.config/proxy"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# profile
if [[ $MDX_PROFILE_ZSH = yes ]]; then
  zprof
  unset MDX_PROFILE_ZSH
fi
