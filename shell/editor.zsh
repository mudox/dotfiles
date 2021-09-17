# vim: filetype=zsh

case $(uname -s) in
  Darwin )
    # for MacOS
    export EDITOR=nvim
    ;;
  CYGWIN* )
    # for Cygwin on Windows
    export EDITOR=vim
    ;;
  Linux )
    # for Linux
    export EDITOR=vim
    ;;
  * )
    printf "\e[31m[.zshrc]: un-recognized platform.\e[0m\n"
    ;;
esac

