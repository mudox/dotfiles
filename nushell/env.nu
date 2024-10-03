$env.EDITOR = 'nvim'

$env.NU_LIB_DIRS = [ ~/.dotfiles/nushell/lib ]

$env.NU_USE_IR = 1 # experiment new IR

# ISSUE: `path type` errors out if path does not exists
# zoxide init nushell | save -f ~/.dotfiles/nushell/mudox/init/zoxide.generated.nu
