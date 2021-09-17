#!/usr/bin/env zsh
set -euo pipefail

jack -b3 info '3-BIT COLOR IN BACKGROUND \n'
cat <<END
   syntax: \e[{semicolon separated digits}m where:
     30-37 -> foreground color
     40-47 -> background color
     0     -> reset
     1     -> bold
     5     -> blink
     7     -> reverse

END

for fg in {30..37}; do
  col1_width=8
  # no effect
  printf "%${col1_width}s  " 'normal'
  for bg in {40..47}; do
    printf "\e[${fg}m\e[${bg}m%s\e[0m " " ${fg};${bg} "
  done
  printf '\n'

  # bold
  printf "%${col1_width}s  " 'bold'
  for bg in {40..47}; do
    printf "\e[1;${fg}m\e[${bg}m%s\e[0m " " ${fg};${bg} "
  done
  printf '\n'

  # blink
  printf "%${col1_width}s  " 'blink'
  for bg in {40..47}; do
    printf "\e[5;${fg}m\e[${bg}m%s\e[0m " " ${fg};${bg} "
  done
  printf '\n'

  # reverse
  printf "%${col1_width}s  " 'reverse'
  for bg in {40..47}; do
    printf "\e[7;${fg}m\e[${bg}m%s\e[0m " " ${fg};${bg} "
  done
  printf '\n\n'
done

jack -b3 info '256 COLOR IN BACKGROUND \n'
jack -b1 verbose 'syntax: \e[48;5;[0-255]m'

for i in {0..255} ; do
  if (( i % 8 == 0 )); then
    printf "\n";
  fi

  if ((
    i == 0 || i == 18 || i == 19 || i == 124
    || ( 52 <= i && i <= 55 )
    || ( 88 <= i && i <= 95 )
    || ( 232 <= i && i <= 243 )
    ))
  then
    printf "\e[37m\e[48;5;%sm %3s \e[0m " "$i" "$i"
  else
    printf "\e[30m\e[48;5;%sm %3s \e[0m " "$i" "$i"
  fi
done

jack -b3 info '256 COLOR IN FOREGROUND \n'
jack -b1 verbose 'syntax: \e[38;5;[0-255]m'

for i in {0..255} ; do
  if (( i % 8 == 0 )); then
    printf "\n";
  fi

  if ((
    i == 0 || i == 18 || i == 19 || i == 124
    || ( 52 <= i && i <= 55 )
    || ( 88 <= i && i <= 95 )
    || ( 232 <= i && i <= 243 )
    ))
  then
    printf "\e[37m\e[38;5;%sm %3s \e[0m " "$i" "$i"
  else
    printf "\e[30m\e[38;5;%sm %3s \e[0m " "$i" "$i"
  fi
done

jack -b3 info 'TRUE COLOR\n'
jack -b1 verbose 'syntax: \e[48;2;[r];[g];[b]m'

for i in {0..255} ; do
  if (( i % 16 == 0 )); then
    printf '\n';
  fi

  r=$i
  g=$(( (i + 127 + 255) % 255 ))
  b=$(( 255 - i ))

  printf '\e[48;2;%s;%s;%sm   \e[0m' $r $g $b
done

print

# vim: ft=sh
