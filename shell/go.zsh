# vim: filetype=zsh

# environment GOPATH
export GOPATH=${HOME}/Develop/go
path+=("${GOPATH}/bin")

# environment GOROOT
export GOROOT="$(go env GOROOT)"
