$env.config.edit_mode = 'emacs'

$env.config.keybindings = [
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
    mode: [emacs, vi_normal, vi_insert]
    event: { send: clearscreen }
  }

  # not work
  {
    name: stong_reset
    modifier: control_shift
    keycode: char_l
    mode: [emacs, vi_normal, vi_insert]
    event: { send: clearscreen }
  }

  # help
  {
    name: help_menu
    modifier: alt
    keycode: char_h
    mode: [emacs, vi_insert, vi_normal]
    event: { send: menu name: help_menu }
  }
]
