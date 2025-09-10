$env.config.edit_mode = 'vi'

$env.config.keybindings ++= [
  # clear screen
  {
    name: clear_screen
    modifier: control
    keycode: char_l
    mode: [emacs, vi_normal, vi_insert]
    event: null
  }
  {
    name: clear_screen
    modifier: alt
    keycode: char_l
    mode: [emacs, vi_insert]
    event: { send: clearscreen }
  }
  # help
  {
    name: help_menu
    modifier: alt
    keycode: char_h
    mode: [emacs, vi_insert]
    event: { send: menu name: help_menu }
  }
  # kill line
  {
      name: clear_line
      modifier: control
      keycode: char_u
      mode: [emacs, vi_insert]
      event: { edit: clear }
  }
]
