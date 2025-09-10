$env.config.buffer_editor = 'nvim'

$env.config.show_banner = false

$env.config.table = {
  mode: single
  padding: { left: 0, right: 0 }
  missing_value_symbol: 󰟢
}

$env.config.use_kitty_protocol = true

# keybinding
source-env ~/.dotfiles/nushell/init/keybinding.nu

# ui
source-env ~/.dotfiles/nushell/init/ui.nu

# completion
source-env ~/.dotfiles/nushell/init/completion.nu

# alias
use ~/.dotfiles/nushell/init/alias.nu *

# zoxide
zoxide init nushell | save -f ~/.dotfiles/nushell/init/zoxide.generated.nu
source ~/.dotfiles/nushell/init/zoxide.generated.nu
