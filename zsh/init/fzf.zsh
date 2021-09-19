if [[ ! $- =~ i ]]; then
  return
fi

#export FZF_DEFAULT_COMMAND='ag --nocolor -l -g ""'
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_COMPLETION_TRIGGER=',,'
export FZF_COMPLETION_OPTS='-e'
export FZF_DEFAULT_OPTS='
--height=70%
--min-height=40
--layout=reverse
--info=inline
--pointer=▶
--border=rounded --margin=1 --padding=1
--bind=ctrl-f:page-down,ctrl-b:page-up
--select-1
'

zinit snippet 'https://github.com/fnune/base16-fzf/blob/master/bash/base16-gruvbox-dark-hard.config'

FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=gutter:-1,bg+:-1"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

if [[ "$SHELL" == "bash" ]]; then
  return
fi

# ^R to paste the selected command from history into the command line.                                           {{{1
# press ^R in the fzf UI to apply sort
fzf-history-widget() {
  local selected restore_no_bang_hist
  if selected=($(fc -l 1 | grep '^.\{12,\}' | sort -k2 | uniq -f1 |
    fzf +s --tac +m -n2..,.. --tiebreak=index -q "$LBUFFER")); then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle redisplay
}

zle -N fzf-history-widget
bindkey '^R' fzf-history-widget
# }}}1

# ^Tf to insert file & paths under $(pwd) to the command line.                                                   {{{1
__fsel() {
  set -o nonomatch
  command find ./* -path '*/\.*' -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2>/dev/null | fzf -m -e | while read item; do
    printf '%q ' "$item"
  done
  echo
}

fzf-file-widget() {
  LBUFFER="${LBUFFER}$(__fsel)"
  zle redisplay
}

zle -N fzf-file-widget
bindkey '^Tf' fzf-file-widget
# }}}1

# ^Tj to insert paths from $(z -l) to the command line.                                                          {{{1
__zdirs() {
  set -o nonomatch
  z -l | sed 's/[0-9.,]* *//' | fzf -m -e | while read item; do
    printf '%q ' "$item"
  done
  echo
}

mudox-zsh-widget-zdirs() {
  LBUFFER="${LBUFFER}$(__zdirs)"
  zle redisplay
}

zle -N mudox-zsh-widget-zdirs
bindkey '^Tj' mudox-zsh-widget-zdirs
# }}}1

# ^[j to cd to one of the paths in $(z -l).                                                                      {{{1
mudox-zsh-widget-j() {
  if [[ -z "$(whence z)" ]]; then
    printf "\e[31mneed z, quit...\e[0m\n"
    return
  fi

  local target_dir
  target_dir=$(
    z -l | sed 's/[0-9.,]* *//' |
      fzf \
        --tiebreak=end,length \
        --margin=2 \
        --select-1 \
        --exit-0
  )

  [ -n "$target_dir" ] && cd "$target_dir"

  zle reset-prompt
}

zle -N mudox-zsh-widget-j
bindkey '^[j' mudox-zsh-widget-j
#}}}1

# ^[k to cd to one of directory under current path.                                                              {{{1
# do not descend into hidden directories.
mudox-zsh-widget-c() {
  local target_dir
  target_dir=$(
    find ./* -path '*/\.*' -prune \
      -o -type d -print 2>/dev/null |
      fzf \
        --height=20% --min-height=12 \
        --tiebreak=end,length \
        --margin=2 \
        --select-1 \
        --exit-0
  )

  [ -n "$target_dir" ] && cd "$target_dir"

  zle reset-prompt
}

zle -N mudox-zsh-widget-c
bindkey '^[k' mudox-zsh-widget-c
#}}}1

# fe [pattern] to open the selected file with the gvim in tab.                                                   {{{1
fe() {
  local file
  file=$(
    fzf \
      --query="$1" \
      --height=60% --min-height=20 \
      --tiebreak=end,length \
      --margin=2 \
      --select-1 \
      --exit-0
  )

  case $(uname -s) in
  Darwin)
    # for MacOS
    if whence nvim; then
      local vim_bin='nvim'
    else
      local vim_bin='mvim'
    fi
    ;;
  CYGWIN*)
    # for Cygwin on Windows
    local vim_bin="/d/Program Files/Vim/vim74/vim_bin.exe"
    ;;
  Linux)
    # for Linux
    local vim_bin="vim_bin"
    ;;
  *)
    printf "\e[31m[.zshrc]: un-recognized platform.\n"
    ;;
  esac

  if [[ "${vim_bin}" = "nvim" ]]; then
    #statements
    [ -n "$file" ] && "${vim_bin}" "$file"
  else
    [ -n "$file" ] && "${vim_bin}" --remote-tab-silent "$file"
  fi
} #}}}1

# fkill to select & kill procces.                                                                                {{{1
fkill() {
  ps -axo pid,command |
    sed '1d' |
    fzf --multi --nth=2 --extended-exact |
    awk '{print $1}' |
    xargs kill -"${1:-9}"
} #}}}1

# cmake help selection.                                                                                          {{{1

# cmake helps                                                                                                    {{{2
cmh() {
  local category
  local usage="\
    usage: $0 <c|ma|mo|po|pr|v> [selection]
  where
  c  - command
  ma - manual
  mo - module
  po - policy
  pr - property
  v  - variable"

  if [[ "$#" -eq 0 ]]; then
    local categories="command\nmanual\nmodule\npolicy\nproperty\nvariable"

    category=$(echo ${categories} | fzf \
      --query="$2" \
      --select-1 \
      --extended-exact \
      --prompt="cmake help category: ")

    if [[ -z "${category}" ]]; then
      return
    fi
  else
    case "$1" in
    c)
      category="command"
      ;;
    ma)
      category="manual"
      ;;
    mo)
      category="module"
      ;;
    po)
      category="policy"
      ;;
    pr)
      category="property"
      ;;
    v)
      category="variable"
      ;;
    *)
      printf "\e[31m%s: invalid first argument\e[0m\n" "$0"
      echo "${usage}"
      return
      ;;
    esac
  fi

  local selection
  selection=$(cmake --help-${category}-list |
    sed '1d' | sort | uniq |
    fzf \
      --query="$2" \
      --select-1 \
      --extended-exact \
      --prompt="cmake help ${category}: ")
  if [[ -n "${selection}" ]]; then
    cmake "--help-${category}" "${selection}" | less
  fi
}
# }}}2

# ctest helps                                                                                                    {{{2
# NOTE: just a copy of cmh() above, with all 'cmake' replaced with 'ctest'.
cth() {
  local category
  local usage="\
    usage: $0 <c|ma|mo|po|pr|v> [selection]
  where
  c  - command
  ma - manual
  mo - module
  po - policy
  pr - property
  v  - variable"

  if [[ "$#" -eq 0 ]]; then
    local categories="command\nmanual\nmodule\npolicy\nproperty\nvariable"

    category=$(echo ${categories} | fzf \
      --query="$2" \
      --select-1 \
      --extended-exact \
      --prompt="ctest help category: ")

    if [[ -z "${category}" ]]; then
      return
    fi
  else
    case "$1" in
    c)
      category="command"
      ;;
    ma)
      category="manual"
      ;;
    mo)
      category="module"
      ;;
    po)
      category="policy"
      ;;
    pr)
      category="property"
      ;;
    v)
      category="variable"
      ;;
    *)
      printf "\e[31m%s: invalid first argument\e[0m\n" "$0"
      echo "${usage}"
      return
      ;;
    esac
  fi

  local selection
  selection=$(ctest --help-${category}-list |
    sed '1d' | sort | uniq |
    fzf \
      --query="$2" \
      --select-1 \
      --extended-exact \
      --prompt="ctest help ${category}: ")

  if [[ -n "${selection}" ]]; then
    ctest "--help-${category}" "${selection}" | less
  fi
}
# }}}2

# }}}1

# vim: filetype=zsh foldmethod=marker
