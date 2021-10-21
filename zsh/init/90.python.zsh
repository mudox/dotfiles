# vim: fdm=marker

# pyenv {{{1

if ! command -v pyenv >/dev/null 2>&1; then
  echo 'install pyenv through `brew install pyenv`'
  exit
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(pyenv init -)"

# issue: Invalid configuration `arm64-apple-darwin20.6.0': machine `arm64-apple' not recognized
# see: https://github.com/pyenv/pyenv/issues/1768#issuecomment-871602950
export PYTHON_CONFIGURE_OPTS="--build=aarch64-apple-darwin20.5.0"
# }}}1

# pipx {{{1

export PATH="$PATH:/Users/mudox/.local/bin"

# }}}1
