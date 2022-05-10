#  vim: fdm=marker fmr=〈,〉

# configs
() {
  local dir=${MDX_DOT_DIR}/zsh
  source "${dir}/zinit.zsh"
  source "${dir}/ohmyzsh.zsh"
  source "${dir}/custom.zsh"
}

# prompt
eval "$(starship init zsh)"

# color
if [[ -n $PS1 ]]; then
  eval "$("${MDX_GIT_DIR}/base16-shell/profile_helper.sh")"
fi

# path
path=(
	~/.bin						 # my bins
	~/.bin/*(/)

	~/.local/bin	     # pipx likes to put installed binaries here

	~/.cargo/bin       # cargo
	~/.rbenv/shims		 # rbenv
	~/.pyenv/shims		 # pyenv

	# Homebrew
	/opt/homebrew/bin
	/opt/homebrew/sbin

	/usr/local/bin		 # macOS applications like to put commands here

	/usr/bin
	/usr/sbin
	/bin
	/sbin

	$path
)
