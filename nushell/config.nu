$env.config = {
  show_banner: false

  table: {
    padding: { left: 0, right: 0 }
  }

  use_kitty_protocol: true
}

# keybinding
source-env ~/.dotfiles/nushell/init/keybinding.nu

# ui
source-env ~/.dotfiles/nushell/init/ui.nu

# completion
source-env ~/.dotfiles/nushell/init/completion.nu

# zoxide
source ~/.dotfiles/nushell/init/zoxide.generated.nu

# alias
use ~/.dotfiles/nushell/init/alias.nu *
