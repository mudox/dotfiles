#!/usr/bin/env zsh
set -euo pipefail

source ~/.dotfiles/scripts/lib/jack.zsh

usage='$0 [repo-name]'

if [[ $# -eq 0 ]]; then
  read -p 'Name repo name: ' repo_name
elif [[ $# -eq 1 ]]; then
  repo_name="$1"
else
  jackError "$usage"
  exit 1
fi

jackInfo '\n[1/4] Making .gitignore'
sleep 1

types=$(git ignore list | tr ',' '\n' | fzf -m)
for type in ${types}; do
  echo "- ${type}"
  git ignore "${type}" >>.gitignore
done

jackInfo '\n[2/4] Initializing Git repo'
sleep 1

git init
git add --all
git commit -m 'Initial commit'

jackInfo "\n[3/4] Creating Github repo: github.com/mudox/${repo_name}"
sleep 1

hub create "${repo_name}"

jackInfo '\n[4/4] Performing initial push'
sleep 1

git push --set-upstream origin master

jackInfo "\nDone, bringing you to github.com/mudox/${repo_name}"
sleep 1

hub browse
