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
omz_plugins=(
  git
  git-extras

  copydir
  copyfile

  brew

  bundler

  cargo
)

for plug in $omz_plugins; do
  zinit ice lucid wait'1'
  zinit snippet "OMZP::${plug}"
done
}

zinit ice lucid wait
zinit snippet "OMZP::tmux"

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
zinit light 'zdharma-continuum/fast-syntax-highlighting'

# Zsh history search & match
zinit ice wait lucid
zinit light 'zsh-users/zsh-history-substring-search'

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
