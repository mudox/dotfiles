# vim: filetype=zsh

export COCOAPODS_DISABLE_STATS=true

alias pi='bundle exec pod install'
alias piu='bundle exec pod install --repo-update'
alias pout='bundle exec pod outdated'

alias rxi='rm -rf *.xcodeproj *.xcworkspace; bundle exec xcodegen && bundle exec pod install'
alias rxiu='rm -rf *.xcodeproj *.xcworkspace; bundle exec xcodegen && bundle exec pod install --repo-update'
