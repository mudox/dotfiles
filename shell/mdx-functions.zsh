#!/bin/bash

# usage: sleepc <time> [interval [prompt]]
sleepc() {
  local sleep_time=${1:?need at least 1 argument as sleep time}
  local sleep_interval=${2:-'0.1'}
  local prompt=${3:-"sleeping ..."}
  local steps=$((sleep_time / sleep_interval + 1))

  for (( i = 0; i < steps; i++ )); do
    sleep "${sleep_interval}s"
    printf "\r\e[3$((i % 8 + 1))m${prompt} [%02.2f seconds left]" $((sleep_time - sleep_interval * i))
  done
  unset i

  printf "\r                                                                                                     "
  echo "\r\e[35m${prompt}\e[0m"
}
