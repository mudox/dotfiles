#  vim: fdm=marker fmr=\ 〈,\ 〉

# pyenv 〈

if [[ -z $PYENV_ROOT ]]; then
	export PYENV_ROOT="$HOME/.pyenv"
	eval "$(pyenv init -)"
fi

# 〉

# pipx 〈

path=($path ~/.local/bin)

# 〉
