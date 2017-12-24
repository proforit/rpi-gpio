#!/bin/bash

# General variables
logfile=/root/pinlogger.log

# Pins to check by default, customize these and anything else in a variables-override.sh script.
pincheck="29 31 33 37"

# Pin names
# Generated with:
# for i in {1..40}; do echo -e "pin$i=\"pin$i\"\npin${i}status0=\"closed\"\npin${i}status1=\"open\"\n"; done

pin1="pin1"
pin1status0="closed"
pin1status1="open"

pin2="pin2"
pin2status0="closed"
pin2status1="open"

pin3="pin3"
pin3status0="closed"
pin3status1="open"

pin4="pin4"
pin4status0="closed"
pin4status1="open"

pin5="pin5"
pin5status0="closed"
pin5status1="open"

pin6="pin6"
pin6status0="closed"
pin6status1="open"

pin7="pin7"
pin7status0="closed"
pin7status1="open"

pin8="pin8"
pin8status0="closed"
pin8status1="open"

pin9="pin9"
pin9status0="closed"
pin9status1="open"

pin10="pin10"
pin10status0="closed"
pin10status1="open"

pin11="pin11"
pin11status0="closed"
pin11status1="open"

pin12="pin12"
pin12status0="closed"
pin12status1="open"

pin13="pin13"
pin13status0="closed"
pin13status1="open"

pin14="pin14"
pin14status0="closed"
pin14status1="open"

pin15="pin15"
pin15status0="closed"
pin15status1="open"

pin16="pin16"
pin16status0="closed"
pin16status1="open"

pin17="pin17"
pin17status0="closed"
pin17status1="open"

pin18="pin18"
pin18status0="closed"
pin18status1="open"

pin19="pin19"
pin19status0="closed"
pin19status1="open"

pin20="pin20"
pin20status0="closed"
pin20status1="open"

pin21="pin21"
pin21status0="closed"
pin21status1="open"

pin22="pin22"
pin22status0="closed"
pin22status1="open"

pin23="pin23"
pin23status0="closed"
pin23status1="open"

pin24="pin24"
pin24status0="closed"
pin24status1="open"

pin25="pin25"
pin25status0="closed"
pin25status1="open"

pin26="pin26"
pin26status0="closed"
pin26status1="open"

pin27="pin27"
pin27status0="closed"
pin27status1="open"

pin28="pin28"
pin28status0="closed"
pin28status1="open"

pin29="pin29"
pin29status0="closed"
pin29status1="open"

pin30="pin30"
pin30status0="closed"
pin30status1="open"

pin31="pin31"
pin31status0="closed"
pin31status1="open"

pin32="pin32"
pin32status0="closed"
pin32status1="open"

pin33="pin33"
pin33status0="closed"
pin33status1="open"

pin34="pin34"
pin34status0="closed"
pin34status1="open"

pin35="pin35"
pin35status0="closed"
pin35status1="open"

pin36="pin36"
pin36status0="closed"
pin36status1="open"

pin37="pin37"
pin37status0="closed"
pin37status1="open"

pin38="pin38"
pin38status0="closed"
pin38status1="open"

pin39="pin39"
pin39status0="closed"
pin39status1="open"

pin40="pin40"
pin40status0="closed"
pin40status1="open"

# Update/change variables in this file
if [ -e variables-override.sh ]; then
  . ./variables-override.sh
fi
