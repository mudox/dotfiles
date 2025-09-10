# vim: fml& fdn& fdm=marker fmr=〈,〉

# auto remove unmatched pattern, but least one must be matched
# otherwise report error
setopt csh_null_glob

# History 〈

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

# History 〉

setopt no_correct
setopt no_correct_all

setopt ignore_eof

bindkey '\eq' push-line-or-edit

# ast-grep
eval "$(ast-grep completions)"

# mise
eval "$(mise activate zsh)"
