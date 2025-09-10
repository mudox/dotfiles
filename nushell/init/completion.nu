let zoxide = {|spans|
  $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}

let fish = {|spans|
  fish --command $'complete "--do-complete=($spans | str join " ")"'
  | $"value(char tab)description(char newline)" + $in
  | from tsv --flexible --no-infer
}

let carapace = {|spans: list<string>|
  carapace $spans.0 nushell ...$spans
  | from json
  | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

let completer = {|spans|
  let expanded_alias = scope aliases
  | where name == $spans.0
  | get -o 0.expansion

  let spans = if $expanded_alias != null {
    $spans
    | skip 1
    | prepend ($expanded_alias | split row ' ' | take 1)
  } else {
    $spans
  }

  match $spans.0 {
    nu                       => $fish
    git                      => $fish
    __zoxide_z | __zoxide_zi => $zoxide
    _                        => $carapace
  } | do $in $spans
}

$env.config.completions.external = {
  completer: $completer
}
