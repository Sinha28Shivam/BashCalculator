#!/bin/bash

# source the file that contains the process_file function
source calculate.sh
source functions.sh
source scientific.sh
#source bodmas.sh

# loop over all files in the directory and process them continuously
while true; 
do
 options=(1 "Normal Calculation"
         2 "Scientific Calculation"
         3 "Calculation History"
         4 "Exit")
        
choice=$(dialog --clear --title "Calculator" --menu "Please select a mode of calculation:" 15 50 4 "${options[@]}" 2>&1 >/dev/tty)

case $choice in
	1)
	  Normal_Calculation
	  ;;
	2)
	  Scientific_Calculation
	  ;;
	3)
	  recent
	  ;;
	4)
	  break
 	  ;;
	esac
  done
clear

