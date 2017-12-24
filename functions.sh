#!/bin/bash

# Import variables
. ./variables.sh

# Prints the status of one, all or a range of pins.
# Usage
#  pincheck
#  pincheck 35
#  pincheck 30 40
get-gpio-pin-status() {
  if [ $1 ] && [ $2 ]; then
    pinlow=$1
    pinhigh=$2
  elif [ $1 ]; then
    pinlow=$1
    pinhigh=$1
  else
    pinlow=1
    pinhigh=40
  fi

  for i in $(eval echo {${pinlow}..${pinhigh}}); do
    gpio -1 read $i | tr -d '\n'
  done

  # Return a new line to be nice
  echo
}

set-gpio-pin-output() {
  gpio -1 mode ${1} out && gpio -1 write ${1} 1
}

# Prints time nicely.
# From https://unix.stackexchange.com/questions/27013/displaying-seconds-as-days-hours-mins-seconds
displaytime() {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  (( $D > 0 )) && printf '%d days ' $D
  (( $H > 0 )) && printf '%d hours ' $H
  (( $M > 0 )) && printf '%d minutes ' $M
  (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
  printf '%d seconds\n' $S
}

# Returns the current date as an epoch or if an epoch is passed to it,
# it compares it to the current date and gives the difference.
epoch() {
  # If there is an arg, assume it's an epoch and compare it to now
  if [ $1 ]; then
    displaytime $(( $(epoch) - $( date --date=@$1 +'%s' ) ))
  else
  # If there isn't an arg, get the current date formatted as an epoch
    date +'%s'
  fi
}
