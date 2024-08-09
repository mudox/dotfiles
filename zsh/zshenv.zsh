# Proxy
source "${HOME}/.config/proxy"

# Global environments
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

# Locale
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# Cargo
source "$HOME/.cargo/env"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python
source "${MDX_DOT_DIR}/zsh/zshenv/python.zsh"

# Java
export JAVA_HOME="$(/usr/libexec/java_home)"

# `fpath`
typeset -U fpath

# Neovim
export EDITOR=nvim

# Rust
export RUST_BACKTRACE=1

# `path`
typeset -U path
path=(
  # my
  ~/.bin
  ~/.bin/*(/)

  # shims
  ~/.rbenv/shims            # rbenv
  ~/.pyenv/shims            # pyenv
  ~/.local/share/mise/shims # mise

  ~/.cargo/bin # cargo

  ~/.local/bin   # pipx likes to put installed binaries here
  /usr/local/bin # macOS applications like to put commands here

  $path
)
