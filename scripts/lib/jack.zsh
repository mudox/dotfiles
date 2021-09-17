#!/usr/bin/env bash

jack_black='\e[30m'
jack_red='\e[31m'
jack_green='\e[32m'
jack_yellow='\e[33m'
jack_blue='\e[34m'
jack_magenta='\e[35m'
jack_cyan='\e[36m'
jack_white='\e[37m'

jack_grey='\e[38;5;245m'

jack_reset='\e[0m'

jack_error_symbol=' '
jack_warning_symbol=' '
jack_info_symbol=' '

jack_note_symbol=' '
jack_success_symbol=' '

jackError()   { jackEndProgress; printf "${jack_red}${jack_error_symbol} $*${jack_reset}\n"; }
jackWarn()    { jackEndProgress; printf "${jack_magenta}${jack_warning_symbol} $*${jack_reset}\n"; }
jackInfo()    { jackEndProgress; printf "\n${jack_yellow}${jack_info_symbol} $*${jack_reset}\n"; }
jackDebug()   { jackEndProgress; printf "${jack_cyan}$*${jack_reset}\n"; }
jackVerbose() { jackEndProgress; printf "${jack_grey}$*${jack_reset}\n"; }

jackNote() { jackEndProgress; printf "${jack_blue}${jack_note_symbol} $*${jack_reset}\n"; }
jackSuccess() { jackEndProgress; printf "${jack_yellow}${jack_note_symbol} $*${jack_reset}\n"; }

# override current line with $*
jackProgress() { jackEndProgress; printf "${jack_green}$*${jack_reset}"; }
# clear current line
jackEndProgress() { printf $"\r$(tput el)"; }
