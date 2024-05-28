use lib

let keybindings = [
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

let menus = [
  {
    name: completion_menu
    only_buffer_difference: false
    marker: ""
    type: {
      layout: columnar
      columns: 4
      col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
      col_padding: 2
    }
    style: {
      text: green
      selected_text: { attr: r }
      description_text: yellow
      match_text: { attr: u }
      selected_match_text: { attr: ur }
    }
  }
  {
    name: ide_completion_menu
    only_buffer_difference: false
    marker: ""
    type: {
      layout: ide
      min_completion_width: 0,
      max_completion_width: 50,
      max_completion_height: 10, # will be limited by the available lines in the terminal
      padding: 0,
      border: true,
      cursor_offset: 0,
      description_mode: "prefer_right"
      min_description_width: 0
      max_description_width: 50
      max_description_height: 10
      description_offset: 1
      # If true, the cursor pos will be corrected, so the suggestions match up with the typed text
      #
      # C:\> str
      #      str join
      #      str trim
      #      str split
      correct_cursor_pos: true
    }
    style: {
      text: green
      selected_text: { attr: r }
      description_text: yellow
      match_text: { attr: u }
      selected_match_text: { attr: ur }
    }
  }
  {
    name: history_menu
    only_buffer_difference: true
    marker: ""
    type: {
      layout: list
      page_size: 10
    }
    style: {
      text: green
      selected_text: green_reverse
      description_text: yellow
    }
  }
  {
    name: help_menu
    only_buffer_difference: true
    marker: ""
    type: {
      layout: description
      columns: 4
      col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
      col_padding: 2
      selection_rows: 4
      description_rows: 10
    }
    style: {
      text: green
      selected_text: green_reverse
      description_text: yellow
    }
  }
]

let color = {
  row_index: dark_gray
}

$env.config = {
  show_banner: false

  table: {
    padding: { left: 0, right: 0 }
  }

  completions: {
    algorithm:      "fuzzy" # prefix or fuzzy
  }

  use_kitty_protocol: true

  menus: $menus

  # keybindings
  edit_mode: emacs,
  cursor_shape: {
    vi_insert: line
    vi_normal: block
  }
  keybindings: $keybindings

  color_config: $color
}

use ~/.cache/starship/init.nu
$env.PROMPT_INDICATOR_VI_INSERT = ''
$env.PROMPT_INDICATOR_VI_NORMAL = ''
