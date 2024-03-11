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

# path
path=(
    ~/.bin                  # my bins
    ~/.bin/*(/)

    ~/.mint/bin             # mint binaries

    ~/.local/bin            # pipx likes to put installed binaries here

    ~/.cargo/bin            # cargo
    ~/.rbenv/shims          # rbenv
    ~/.pyenv/shims          # pyenv

    # Homebrew
    /opt/homebrew/bin
    /opt/homebrew/sbin

    /usr/local/bin          # macOS applications like to put commands here

    /usr/bin
    /usr/sbin
    /bin
    /sbin

    $path
)

# zoxide
eval "$(zoxide init zsh)"

# broot
source /Users/mudox/.config/broot/launcher/bash/br

# pnpm
export PNPM_HOME="/Users/mudox/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
