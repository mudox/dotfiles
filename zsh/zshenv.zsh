# proxy
source "${HOME}/.config/proxy"

# global env
: ${MDX_GIT_DIR:="${HOME}/Git"}
export -r MDX_GIT_DIR

: ${MDX_DOT_DIR:="${HOME}/.dotfiles"}
export -r MDX_DOT_DIR

: ${MDX_NVIM_DIR:="${HOME}/Git/neovim-config"}
export -r MDX_NVIM_DIR

: ${MDX_TMUX_DIR:="${HOME}/Git/tmux-config"}
export -r MDX_TMUX_DIR

: ${MDX_HS_DIR:="${HOME}/Git/hs-config"}
export -r MDX_HS_DIR

: ${MDX_DEV_DIR:="${HOME}/Develop"}
export MDX_DEV_DIR

# locale
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# path
typeset -U path
typeset -U fpath

# cargo
source "$HOME/.cargo/env"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

