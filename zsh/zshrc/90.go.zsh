# vim: filetype=zsh

if [[ -n $DID_INIT_GO ]]; then
	return
fi
export DID_INIT_GO=1

# environment GOPATH
export GOPATH=${HOME}/Develop/go
path+=("${GOPATH}/bin")

# environment GOROOT
export GOROOT="$(go env GOROOT)"
