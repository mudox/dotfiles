# vim: filetype=zsh foldmethod=marker

### Added by Zinit's installer

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Load oh-my-zsh plugins as `snippet`s
() {
    local omz_plugins=(
        git
        git-extras

        copypath
        copyfile

        brew

        bundler
        # cargo # it contributes 55 ~ 130ms startup time
    )

    for plug in $omz_plugins; do
        zinit ice wait lucid
        zinit snippet "OMZP::${plug}"
    done
}

# Load plguins lazily
() {
    local plugins=(
        djui/alias-tips
        wfxr/forgit
    )

    for plug in $plugins; do
        zinit ice wait lucid
        zinit light "$plug"
    done
}

# Zsh history search & match
zinit ice wait lucid
zinit light 'zsh-users/zsh-history-substring-search'

# Syntax highlighting + completion + suggestion
zinit wait lucid for \
    atinit'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' 'zdharma-continuum/fast-syntax-highlighting' \
    blockf 'zsh-users/zsh-completions' \
    atload'!_zsh_autosuggest_start'  'zsh-users/zsh-autosuggestions'

# LS_COLOR
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" atpull'%atclone' \
    pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'

zinit light trapd00r/LS_COLORS
