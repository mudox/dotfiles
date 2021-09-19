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

# Prompt {{{1

# multiline
PS2=$'\e[38;5;19m🭰 \e[0m'
# loop
PS3=$'\e[38;5;19m🭰 \e[0m'
# debug
PS4=$'\e[38;5;166m[%N]:%i \e[0m'

# }}}1

setopt correct
setopt no_correct_all
