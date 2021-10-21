# vim: filetype=zsh foldmethod=marker

## Init {{{1
### Added by Zinit's installer

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
# }}}1

# Load oh-my-zsh plugin as `snippet`
() {
  omz_plugins=(
    git
    git-extras

    copydir
    copyfile

    brew

    tmux

    bundler

    cargo
  )

  for plug in $omz_plugins; do
    zinit ice lucid wait'1'
    zinit snippet "OMZP::${plug}"
  done
}

# Load plguins lazily
() {
  local plugins=(
    djui/alias-tips

    rupa/z
    # skywind3000/z.lua
  )

  for plug in $plugins; do
    zinit ice lucid wait
    zinit light "$plug"
  done
}

# Zsh syntax highlighting
zinit light zdharma/fast-syntax-highlighting

# Zsh History search & match
zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

# Zsh completion
zinit ice blockf wait lucid
zinit light 'zsh-users/zsh-completions'

# Zsh auto suggestions
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light 'zsh-users/zsh-autosuggestions'

# LS_COLOR
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" atpull'%atclone' \
  pick"clrs.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS
