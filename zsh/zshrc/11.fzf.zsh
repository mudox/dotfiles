# vim: fml& fdn& fdm=marker fmr=〈,〉

if [[ ! -o interactive ]]; then
	return
fi

if [[ -n $DID_INIT_FZF ]]; then
	return
fi
export DID_INIT_FZF=1

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_COMPLETION_TRIGGER=',,'
export FZF_COMPLETION_OPTS='-e'
export FZF_DEFAULT_OPTS='
--height=50%
--min-height=40
--layout=reverse
--info=inline
--prompt="󰅂 "
--pointer=┃
--border=none --margin=1 --padding=1
--no-scrollbar
--bind=ctrl-f:page-down,ctrl-b:page-up
--select-1
'

export FZF_DEFAULT_OPTS=${FZF_DEFAULT_OPTS}'
	--color=fg:#c0caf5,bg:#232436,gutter:#232436,hl:#bb9af7
	--color=fg+:#ffffff,bg+:#1a1b26,hl+:#7dcfff
	--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
	--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" . "$1"
}

if [[ "$SHELL" == "bash" ]]; then
	return
fi

# ^R to paste the selected command from history into the command line.                                           〈

# press ^R in the fzf UI to apply sort
fzf-history-widget() {
	local selected restore_no_bang_hist
	if selected=($(fc -l 1 | grep '^.\{12,\}' | sort -k2 | uniq -f1 |
		fzf +s --tac +m -n2..,.. --tiebreak=index -q "$LBUFFER")); then
		num=$selected[1]
		if [ -n "$num" ]; then
			zle vi-fetch-history -n $num
		fi
	fi
	zle redisplay
}

zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

# 〉

# ^Tf to insert file & paths under $(pwd) to the command line.                                                   〈

__fsel() {
	set -o nonomatch
	command find ./* -path '*/\.*' -prune \
		-o -type f -print \
		-o -type d -print \
		-o -type l -print 2>/dev/null | fzf -m -e | while read item; do
		printf '%q ' "$item"
	done
	echo
}

fzf-file-widget() {
	LBUFFER="${LBUFFER}$(__fsel)"
	zle redisplay
}

zle -N fzf-file-widget
bindkey '^Tf' fzf-file-widget

# 〉

# ^Tj to insert paths from $(z -l) to the command line.                                                          〈

__zdirs() {
	set -o nonomatch
	z -l | sed 's/[0-9.,]* *//' | fzf -m -e | while read item; do
		printf '%q ' "$item"
	done
	echo
}

mudox-zsh-widget-zdirs() {
	LBUFFER="${LBUFFER}$(__zdirs)"
	zle redisplay
}

zle -N mudox-zsh-widget-zdirs
bindkey '^Tj' mudox-zsh-widget-zdirs

# 〉

# ^[k to cd to one of directory under current path.                                                              〈

# do not descend into hidden directories.
mudox-zsh-widget-c() {
	local target_dir
	target_dir=$(
		find ./* -path '*/\.*' -prune \
			-o -type d -print 2>/dev/null |
			fzf \
				--height=20% --min-height=12 \
				--tiebreak=end,length \
				--margin=2 \
				--select-1 \
				--exit-0
	)

	[ -n "$target_dir" ] && cd "$target_dir"

	zle reset-prompt
}

zle -N mudox-zsh-widget-c
bindkey '^[k' mudox-zsh-widget-c

# 〉

# fe [pattern] to open the selected file with the gvim in tab.                                                   〈

fe() {
	local file
	file=$(
		fzf \
			--query="$1" \
			--height=60% --min-height=20 \
			--tiebreak=end,length \
			--margin=2 \
			--select-1 \
			--exit-0
	)

	case $(uname -s) in
	Darwin)
		# for MacOS
		if whence nvim; then
			local vim_bin='nvim'
		else
			local vim_bin='mvim'
		fi
		;;
	CYGWIN*)
		# for Cygwin on Windows
		local vim_bin="/d/Program Files/Vim/vim74/vim_bin.exe"
		;;
	Linux)
		# for Linux
		local vim_bin="vim_bin"
		;;
	*)
		printf "\e[31m[.zshrc]: un-recognized platform.\n"
		;;
	esac

	if [[ "${vim_bin}" = "nvim" ]]; then
		#statements
		[ -n "$file" ] && "${vim_bin}" "$file"
	else
		[ -n "$file" ] && "${vim_bin}" --remote-tab-silent "$file"
	fi
}

# 〉

# fkill to select & kill procces.                                                                                〈

fkill() {
	ps -axo pid,command |
		sed '1d' |
		fzf --multi --nth=2 --extended-exact |
		awk '{print $1}' |
		xargs kill -"${1:-9}"
}

# 〉

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
