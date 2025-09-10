#!/usr/bin/env nu
#MISE description="neovim: update nightlyi build"

const tar = 'nvim-macos-arm64.tar.gz'
let url = $'https://github.com/neovim/neovim/releases/download/nightly/($tar)'

def log [msg: string] {
  print $'(ansi yellow)($msg)(ansi reset)'
}

def version [] {
  nvim -v | lines | get 0 | inspect
  | parse -r 'v(?P<version>\d+\.\d+\.\d+)-dev-(?P<build>\d+)\+(?P<commit>[a-z0-9]+)'
}

# prepare
log Prepare
mkdir ~/.bin/nvim-nightly
let temp_dir = (mktemp -d)
print $'temp dir: ($temp_dir)'
cd $temp_dir

# download
log Download
wget $url --quiet --show-progress
ls | print

# extract
log Extract
xattr -c $tar
tar xzf $tar # into folder $temp_dir/nvim-macos-arm64/
rm $tar
ls | print

# install
log Install
let version = (nvim-macos-arm64/bin/nvim -v | lines | first | split row -r '\s+' | get 1 | str trim)
let install_dir = ($'~/.bin/nvim-nightly/($version)' | path expand)
print $'install dir: ($install_dir)'
try { rm -r $install_dir }
mv nvim-macos-arm64 $install_dir
ls ~/.bin/nvim-nightly

# link
log Link
# if ('~/.bin/nvim' | path exists) {
ln -vsf $'($install_dir)/bin/nvim' ~/.bin/nvim-n | print $'link: ($in)'
# } else {
#   print 'no link made'
# }

# cleanup
log Cleanup
cd ~/.bin
rm -vr $temp_dir
