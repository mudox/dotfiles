#!/usr/bin/env nu
#MISE description="mise: choose task by fzf"
#MISE quiet=true

let task = (
mise task ls --json | from json | select name description file | where description != ''
| each { |t| $"($t.description)\t($t.name)\t($t.file)" } | sort
| str join (char nul)
| fzf --read0 --delimiter=(char tab) --with-nth=1 --accept-nth=2
  --ghost='choose a task to run/edit'
  --header='ctrl-e: edit'
  --preview='mise task info {2}'
  --bind='ctrl-e:execute(mise task edit {3})'
)

mise run $task
