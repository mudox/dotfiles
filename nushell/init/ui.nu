# colors

let bg             = "#1a1b26"
let bg_dark        = "#16161e"
let bg_highlight   = "#292e42"
let blue           = "#7aa2f7"
let blue0          = "#3d59a1"
let blue1          = "#2ac3de"
let blue2          = "#0db9d7"
let blue5          = "#89ddff"
let blue6          = "#b4f9f8"
let blue7          = "#394b70"
let comment        = "#565f89"
let cyan           = "#7dcfff"
let dark3          = "#545c7e"
let dark5          = "#737aa2"
let fg             = "#c0caf5"
let fg_dark        = "#a9b1d6"
let fg_gutter      = "#3b4261"
let green          = "#9ece6a"
let green1         = "#73daca"
let green2         = "#41a6b5"
let magenta        = "#bb9af7"
let magenta2       = "#ff007c"
let orange         = "#ff9e64"
let purple         = "#9d7cd8"
let red            = "#f7768e"
let red1           = "#db4b4b"
let teal           = "#1abc9c"
let terminal_black = "#414868"
let yellow         = "#e0af68"

let arg            = $blue1
let block          = $fg_dark
let call           = $blue5
let constant       = $orange
let date           = $green1
let error          = $red1
let function       = $blue
let hint           = $comment
let normal         = $fg
let pattern        = $blue6
let record         = $blue1
let string         = $green

let colors = {
  # color for nushell primitives
  binary:                     $constant
  block:                      $block
  bool:                       $constant
  cellpath:                   $pattern
  date:                       $date
  duration:                   $constant
  empty:                      $normal
  filesize:                   $constant
  float:                      $constant
  header:                     { fg: $cyan,     attr: b }
  hints:                      $hint
  int:                        $constant

  # no fg, no bg, attr non effectively turns this off
  leading_trailing_space_bg:  { attr: n }
  list:                       $record
  nothing:                    $normal
  range:                      $pattern
  record:                     $record
  # row_index:                  $constant
  row_index:                  $comment
  separator:                  $hint
  string:                     $string

  # shapes are used to change the CLI syntax highlighting
  shape_binary:               { fg: $constant, attr: b }
  shape_block:                { fg: $block,    attr: b }
  shape_bool:                 { fg: $constant, attr: b }
  shape_custom:               $constant
  shape_datetime:             $date
  shape_external:             $call
  shape_externalarg:          $arg
  shape_filepath:             $pattern
  shape_flag:                 { fg: $arg,      attr: b }
  shape_float:                { fg: $constant, attr: b }
  shape_garbage:              { fg: $error,    attr: b }
  shape_globpattern:          $pattern
  shape_int:                  { fg: $constant, attr: b }
  shape_internalcall:         { fg: $call,     attr: b }
  shape_list:                 $record
  shape_literal:              { fg: $constant, attr: b }
  shape_nothing:              $normal
  shape_operator:             $call
  shape_range:                $pattern
  shape_record:               $record
  shape_signature:            { fg: $block,    attr: b }
  shape_string:               $string
  shape_string_interpolation: $string
  shape_table:                { fg: $function, attr: b }
  shape_variable:             $magenta
}

$env.config.color_config = $colors

# menus

let menu_style = {
  text:             $blue
  selected_text:    { fg: $bg_dark, bg: $orange } # bg: blue0
  description_text: $comment
}

$env.config.menus = [
  {
    name: completion_menu
    only_buffer_difference: false
    marker: "󰍻  "
    type: {
      layout: columnar
      columns: 4
      col_width: 20
      col_padding: 2
    }
    style: $menu_style
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
    style: $menu_style
  }
  {
    name: history_menu
    only_buffer_difference: true
    marker: "  "
    type: {
      layout: list
      page_size: 10
    }
    style: $menu_style
  }
  {
    name: help_menu
    only_buffer_difference: true
    marker: "󰋖 "
    type: {
      layout: description
      columns: 4
      col_width: 20
      col_padding: 2
      selection_rows: 4
      description_rows: 10
    }
    style: $menu_style
  }
  {
    name: commands_menu
    only_buffer_difference: false
    marker: "  "
    type: {
      layout: columnar
      columns: 4
      col_width: 20
      col_padding: 2
    }
    style: $menu_style
    source: { |buffer, position|
      $nu.scope.commands
      | where command =~ $buffer
      | each { |it| {value: $it.command description: $it.usage} }
    }
  }
  {
    name: variable_menu
    only_buffer_difference: true
    marker: "󰫧  "
    type: {
      layout: list
      page_size: 10
    }
    style: $menu_style
    source: { |name, position|
      scope variables
      | where name =~ $name
      | sort-by name
      | each { |it| { value: $it.name description: $it.value } }
    }
  }
  {
    name: commands_with_description
    only_buffer_difference: true
    marker: "  "
    type: {
      layout: description
      columns: 4
      col_width: 20
      col_padding: 2
      selection_rows: 4
      description_rows: 10
    }
    style: $menu_style
    source: { |command, position|
      scope commands
      | where command =~ $command
      | each { |it| {value: $it.command description: $it.usage} }
    }
  }
]


# prompt
use ~/.cache/starship/init.nu
load-env {
  PROMPT_INDICATOR_VI_INSERT: ''
  PROMPT_INDICATOR_VI_NORMAL: ''
}

# cursor
$env.config.cursor_shape = {
  vi_insert: line
  vi_normal: block
  emacs: line
}
