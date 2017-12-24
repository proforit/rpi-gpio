#!/bin/bash

# Include functions
. ./functions.sh

# For debugging, run script with --debug
debug=$(debugcheck ${@})

[ $debug -eq 1 ] && echo "logfile $logfile, pins $pincheck"

# Run and don't stop.
while true; do

  # List of pins
  for pin in $pincheck; do

    [ $debug -eq 1 ] && echo evaluating pin $pin

    # Get the state of the pin in a pinXXstate variable and also the state variable.
    eval pin${pin}state=$(get-gpio-pin-status $pin)
    eval state=\$pin${pin}state

    # If the laststate variable isn't set, set it to the current state.
    if [ ! $(eval echo \$pin${pin}laststate) ]; then
      eval pin${pin}laststate=$state
      eval pin${pin}epoch=$(epoch)
      [ $debug -eq 1 ] && eval echo \$pin${pin}epoch pin${pin}epoch pin${pin}laststate
    fi

    # Set the laststate variable to pinXXlaststate
    eval laststate=\$pin${pin}laststate
    [ $debug -eq 1 ] && echo $laststate

    # If the current state and last state don't match, return change to the console and add it to the log file.
    if [ $state -ne $laststate ]; then
      eval echo "$(epoch)\|$(date)\|$pin\|$state\|$laststate\|\$pin$pin\|\$pin${pin}status${state}\|It had been \$pin${pin}status${laststate} for \$(epoch \$pin${pin}epoch)" | tee -a "${logfile}"
      eval pin${pin}laststate=$state
      eval pin${pin}epoch=$(epoch)
    else
      [ $debug -eq 1 ] && eval echo "$(epoch)\|$(date)\|$pin\|$state\|$laststate\|\$pin$pin\|\$pin${pin}status${state}\|It has been \$pin${pin}status${laststate} for \$(epoch \$pin${pin}epoch)"
    fi
  done

  # Give the CPU a break and only run once a second.
  [ $debug -eq 1 ] && echo sleeping
  sleep 1
done
