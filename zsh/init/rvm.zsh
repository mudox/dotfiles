# vim: filetype=zsh

# NOTE:need source it in both login rc files (e.g. .profile) and interactive shell file (e.g. .zshrc)

# Add RVM to PATH for scripting
path+=("$HOME/.rvm/bin")

# Load RVM into a shell session *as a function* in interactive shell.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
