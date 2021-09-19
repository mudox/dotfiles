# vim: filetype=zsh

MDX_BASE16_ROOT="${MDX_GIT_DIR}/base16-shell/scripts"

if [[ ! -d "$MDX_BASE16_ROOT" ]]; then
  printf "\e[33mneed [base16-shell], installing ...\e[0m\n"
  git clone "https://github.com/chriskempson/base16-shell.git" \
    "$MDX_BASE16_ROOT"
fi

# switch to next picked scheme
basen() {
  export MDX_BASE_COLOR="$(pool base16 pick)"

  local full_path="${MDX_BASE16_ROOT}/base16-${MDX_BASE_COLOR}.sh"
  source "${full_path}"

  printf "\e[33m[BASE16]: \e[1;35m${MDX_BASE_COLOR}\e[0m\n"
}

# ban current scheme & switch to next picked one
baseb() {
  printf "\e[33m[BASE16]: \e[31mban $(pool base16 current) ...\e[0m\n"

  pool base16 ban

  basen
}

# like current item
basel() {
  pool base16 like
}

