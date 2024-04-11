# ri
export RI="--format ansi --width 80"

# rbenv
if [[ -z $DID_INIT_RBENV ]]; then
	export DID_INIT_RBENV=1

	eval "$(rbenv init -)"
fi
