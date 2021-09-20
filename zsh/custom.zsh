# vim: filetype=zsh foldmethod=marker
#
# Load customizing scripts from under shell/ directory
#
# Supporting loading platform agnostic scripts as well
# as platform specific scripts

local init="${MDX_DOT_DIR}/zsh/init"
local macos="$init/macos"
local cygwin="$init/cygwin"
local archlinux="$init/archlinux"

# load system agnostic configs
local load_init_files() {
  for f in $1/*.zsh; do
    source $f
  done
}

local init="${MDX_DOT_DIR}/zsh/init"
local macos="${init}/macos"
local cygwin="${init}/cygwin"
local archlinux="${init}/archlinux"

load_init_files ${init}

# load system specific settings.
case $(uname -s) in
Darwin)
  load_init_files ${macos}
  ;;
CYGWIN*)
  load_init_files ${cygwin}
  ;;
Linux)
  case $(uname -r) in
  *ARCH) # arch linux
    load_init_files ${archlinux}
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

unfunction load_init_files
