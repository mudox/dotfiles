# vim: filetype=zsh

# GitHub API token
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s 'GitHub.PersonalAccessToken.Homebrew' -a ${USER} -w)

# boost bottle downloading
export HOMEBREW_BOTTLE_DOMAIN='https://mirrors.ustc.edu.cn/homebrew-bottles'

# prepend bin paths before /usr/bin
path=(/opt/homebrew/{bin,sbin} $path)
