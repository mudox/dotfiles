# vim: filetype=zsh

# GitHub API token
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -s 'GitHub.PersonalAccessToken.Homebrew' -a ${USER} -w)

# boost bottle downloading
export HOMEBREW_BOTTLE_DOMAIN='https://mirrors.ustc.edu.cn/homebrew-bottles'

# update frequency
export HOMEBREW_AUTO_UPDATE_SECS=$((3600 * 24))
