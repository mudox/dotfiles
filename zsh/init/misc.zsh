# vim: fdm=marker

# auto remove unmatched pattern, but least one must be matched
# otherwise report error
setopt csh_null_glob

# History {{{1

# save history
setopt \
  append_history \
  inc_append_history \
  share_history

# remove duplicates
setopt \
  hist_ignore_all_dups \
  hist_find_no_dups \
  hist_reduce_blanks

# filter history
setopt \
  hist_ignore_space

#}}}

setopt no_correct
setopt no_correct_all

setopt ignore_eof

bindkey '\eq' push-line-or-edit

# insert a empty line bwteen prompt and output
_line_padding() { 
	# remove decoracting empty lines in neovim intgrated terminal
	if [[ -z $VIMRUNTIME ]]; then
		print
	fi
}
add-zsh-hook precmd _line_padding
add-zsh-hook preexec _line_padding
