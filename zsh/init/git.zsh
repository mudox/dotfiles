# vim: filetype=zsh

# shallow clone which is supposed to be faster
alias gsc='git clone --verbose --recursive --depth 1'

# log
alias lg='git lg'
alias lgoh='lg ORIG_HEAD..HEAD'
alias gllg='gl && lgoh'

# editor
if [[ -n $(type nvim) ]]; then
  git config --global core.editor nvim
else
  git config --global core.editor vim
fi

# gitignore.io
function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}


# GitHub cli `gh` 〈

alias ghb='gh browse'
alias ghrw='gh run watch'

# 〉

