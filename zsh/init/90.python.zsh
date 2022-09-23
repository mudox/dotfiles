#  vim: fdm=marker fmr=\ 〈,\ 〉

# pyenv 〈

if ! command -v pyenv >/dev/null 2>&1; then
  echo 'install pyenv through `brew install pyenv`'
  exit
fi

export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

# 〉

# pipx 〈

path=($path ~/.local/bin)

# 〉
