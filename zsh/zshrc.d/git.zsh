# shallow clone which is supposed to be faster
alias gsc='git clone --verbose --recursive --depth 1'

# log
alias lg='git lg'
alias lgoh='lg ORIG_HEAD..HEAD'
alias gllg='gl && lgoh'

# editor
git config --global core.editor nvim

# gh
alias ghb='gh browse'
alias ghrw='gh run watch'

# git-extras
source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh
