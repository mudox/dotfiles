# vim: filetype=zsh foldmethod=marker
#
# Load customizing scripts from under shell/ directory
#
# Supporting loading platform agnostic scripts as well
# as platform specific scripts

local shared="${MDX_DOT_DIR}/shell"
local macos="$shared/macos"
local cygwin="$shared/cygwin"
local archlinux="$shared/archlinux"

# load system agnostic configs
for s in "$shared"/*; do
  [[ -f "$s" ]] && source $s
done

# load system specific settings.
case $(uname -s) in
Darwin)
  for s in "$macos"/*; do
    [[ -f "$s" ]] && source "$s"
  done
  ;;
CYGWIN*)
  for s in "$cygwin"/*; do
    [[ -f "$s" ]] && source "$s"
  done
  ;;
Linux)
  case $(uname -r) in
  *ARCH) # Arch Linux
    source "$archlinux/yaourt"
    source "$archlinux/vpn"
    ;;
  *)
    echo "\e[31m[.zshrc]: un-recognized linux distro."
    ;;
  esac
  ;;
*)
  echo "\e[31m[.zshrc]: un-recognized platform."
  ;;
esac
