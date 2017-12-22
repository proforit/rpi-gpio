#!/bin/bash

# Prints the status of one, all or a range of pins.
# Usage
#  pincheck
#  pincheck 35
#  pincheck 30 40
pincheck() {
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
