# vim: fml& fdn& fdm=marker fmr=〈,〉

if [[ ! -o interactive ]]; then
  return
fi

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
--prompt 'Files> '
--header 'CTRL-T: Switch between Files/Directories'
--bind 'ctrl-t:transform:[[ ! \$FZF_PROMPT =~ Files ]] &&
    echo \"change-prompt(Files> )+reload(fd --type file)\" ||
    echo \"change-prompt(Directories> )+reload(fd --type directory)\"'
 --preview '[[ \$FZF_PROMPT =~ Files ]] && bat --color=always {} || eza --tree --only-dirs --color=always --icons {}'
"

export FZF_DEFAULT_OPTS=''
# search
FZF_DEFAULT_OPTS+='
--exact
--select-1
'
# ui
FZF_DEFAULT_OPTS+='
--height=~50% --min-height=5
--layout=reverse
--info=inline
--border=none --margin=1 --padding=1
--no-scrollbar
--preview-window=border:border-none
'
# key
FZF_DEFAULT_OPTS+='
--bind=ctrl-d:jump
--bind=ctrl-f:page-down,ctrl-b:page-up
'
# color
FZF_DEFAULT_OPTS+='
--color=fg:#c0caf5,bg:#232436,gutter:#232436,hl:#bb9af7
--color=fg+:#ffffff,bg+:#1a1b26,hl+:#7dcfff
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a
'

export FZF_COMPLETION_OPTS='--tiebreak=pathname,end'
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
