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

# Java
export JAVA_HOME="$(/usr/libexec/java_home)"

# `fpath`
typeset -U fpath

# `path`
typeset -U path
path=(
	~/.bin					# my binaries 
	~/.bin/*(/)

	~/.mint/bin     # mint binaries

	~/.local/bin		# pipx likes to put installed binaries here

	~/.rbenv/shims  # rbenv
	~/.pyenv/shims  # pyenv
	~/.cargo/bin    # cargo

	/usr/local/bin  # macOS applications like to put commands here

	$path
)
