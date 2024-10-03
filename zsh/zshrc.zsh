#  vim: fdm=marker fmr=〈,〉

# zinit
source "${MDX_DOT_DIR}/zsh/zinit.zsh"
source "${MDX_DOT_DIR}/zsh/ohmyzsh.zsh"
source "${MDX_DOT_DIR}/zsh/custom.zsh"

# prompt
eval "$(starship init zsh)"

# path
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

  # Homebrew
  /opt/homebrew/bin
  /opt/homebrew/sbin

  # system
  /usr/bin
  /usr/sbin
  /bin
  /sbin

  $path
)

# zoxide
if [[ -z $DID_INIT_ZOXIDE ]]; then
  export DID_INIT_ZOXIDE=1

  export _ZO_ECHO=1
  eval "$(zoxide init zsh)"
fi

# broot
# source /Users/mudox/.config/broot/launcher/bash/br

# pnpm
export PNPM_HOME="/Users/mudox/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
