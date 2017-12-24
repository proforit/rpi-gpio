#!/bin/bash

# Include functions
. ./functions.sh

# Run and don't stop.
while true; do

  # List of pins
  for pin in $pincheck; do

    # Get the state of the pin in a pinXXstate variable and also the state variable.
    eval pin${pin}state=$(get-pin-status $pin)
    eval state=\$pin${pin}state

    # If the laststate variable isn't set, set it to the current state.
    if [ ! $(eval echo \$pin${pin}laststate) ]; then
      eval pin${pin}laststate=$state
      eval pin${pin}epoch=$(epoch)
      eval echo \$pin${pin}epoch
    fi

    # Set the laststate variable to pinXXlaststate
    eval laststate=\$pin${pin}laststate

    # If the current state and last state don't match, return change to the console and add it to the log file.
    if [ $state -ne $laststate ]; then
      eval echo "$(epoch)\|$(date)\|$pin\|$state\|$laststate\|\$pin$pin\|\$pin${pin}status${state}\|It had been \$pin${pin}status${laststate} for \$(epoch \$pin${pin}epoch)" | tee -a "${logfile}"
      eval pin${pin}laststate=$state
      eval pin${pin}epoch=$(epoch)
    fi
  done

  # Give the CPU a break and only run once a second.
  sleep 1
done
