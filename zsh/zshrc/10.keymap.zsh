# Use command `cat > /dev/null` to see key presses echoed in caret notation.
# https://en.wikipedia.org/wiki/Caret_notation

if [[ -n $DID_INIT_KEYMAP ]]; then
	return
fi
export DID_INIT_KEYMAP=1

bindkey -v

viins() {
	bindkey -M viins "$@"
}

viins "^A" beginning-of-line
viins "^E" end-of-line

viins "^B" backward-char
viins "^D" delete-char

viins "^K" kill-whole-line
viins "^U" kill-whole-line

viins "^W" backward-kill-word

viins "^P" history-substring-search-up
viins "^N" history-substring-search-down

viins "^[h" run-help

viins "jk" vi-cmd-mode

vicmd() {
	bindkey -M vicmd "$@"
}

vicmd "k" up-line
vicmd "j" down-line

# Called each time the key-map changes, like from vicmd to viins
zle-keymap-select() {
	if [ $KEYMAP = vicmd ]; then
		printf "\e[1 q" # blinking block
	else
		printf "\e[5 q" # blinking vertical bar
	fi
}
zle -N zle-keymap-select

# Set cursor shape when zle is initalized
zle-line-init() {
	zle -K viins
}
zle -N zle-line-init
