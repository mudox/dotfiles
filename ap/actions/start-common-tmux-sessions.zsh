#!/usr/bin/env zsh
set -euo pipefail

source "${MDX_DOT_DIR/shell/jack.zsh}"

set +u
if tmux list-sessions >/dev/null 2>&1; then
  jack warn 'Tmux server is already running, run `tksv` to kill it'
  exit 1
fi
set -u


jack verbose "Tmux server: $(tmux which-server)"

sessions=(
  Default
  Dotfiles
  Neovim
)

for s in "${sessions[@]}"; do
  session_file="$HOME/Git/tmux-config/sessions/$s.tmux-session.zsh"
  if [[ -f $session_file ]]; then
    "$session_file"
  else
    jack error "Missing session file: $session_file\n"
  fi
done

jack success 'Done, switch to session `Default`!'

exec tmux attach-session -t 'Default'
