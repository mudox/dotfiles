export-env {
  $env.EZA_ICON_SPACING = 2 
}


# eza
export alias tree = eza --tree --icons
export alias t3   = tree -L3
export alias t3a  = tree -L3 --all
export alias t3d  = tree -L3 --only-dirs

export alias x    = eza --icons
export alias xa   = x --all
export alias xl   = x --long
export alias xla  = xl --all

# neovim
export alias vim  = nvim
export alias v    = nvim
export alias rv   = nvr -l

# nushell
export alias w    = which -a
export alias h    = help
export alias '?'  = help

# tmux
export alias trp  = tmux respawn-pane -k -c .
export alias trv  = tmux respawn-pane -k -c . nvim

# homebrew

# git
export use ~/Git/nu_scripts/aliases/git/git-aliases.nu *

export alias gsc = git clone --verbose --recursive --depth 1

# git log
export alias lg   = git lg
export alias lgo  = lg ORIG_HEAD..HEAD
export alias lgu  = lg @{u}..HEAD
