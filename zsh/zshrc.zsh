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
	~/.bin 
	~/.local/bin 

	~/.cargo/bin

	~/.rbenv/shims
	~/.pyenv/shims
	~/.pyenv/shims/bin

	/opt/homebrew/bin
	/opt/homebrew/sbin

	/usr/local/bin  # /Applications apps like to put cli here

	/usr/bin
	/usr/sbin
	/bin
	/sbin

	$path
)
