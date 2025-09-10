#!/usr/bin/env zsh
set -euo pipefail

usage='$0 [repo-name]'

if [[ $# -eq 0 ]]; then
  read -p 'Name repo name: ' repo_name
elif [[ $# -eq 1 ]]; then
  repo_name="$1"
else
  jack error "$usage"
  exit 1
fi

jack info '\n[1/4] Making .gitignore'
sleep 1

types=$(git ignore list | tr ',' '\n' | fzf -m)
for type in ${types}; do
  echo "- ${type}"
  git ignore "${type}" >>.gitignore
done

jack info '\n[2/4] Initializing Git repo'
sleep 1

git init
git add --all
git commit -m 'Initial commit'

jack info "\n[3/4] Creating Github repo: github.com/mudox/${repo_name}"
sleep 1

hub create "${repo_name}"

jack info '\n[4/4] Performing initial push'
sleep 1

git push --set-upstream origin master

jack info "\nDone, bringing you to github.com/mudox/${repo_name}"
sleep 1

hub browse
