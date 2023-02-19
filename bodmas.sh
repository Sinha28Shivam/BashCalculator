#!/bin/bash

# Define function to evaluate an expression using BODMAS order of operations
bodmas_calculation() {
  result=$(echo "scale=4;$1" | bc -l)
  dialog --title "Result" --msgbox "Result: $result" 20 50
}

# Prompt user for input expression
expression=$(dialog --title "BODMAS Calculator" --inputbox "Enter an expression using +, -, *, /, and () operators:" 20 50 2>&1 >/dev/tty)

# Evaluate expression using BODMAS order of operations
bodmas_calculation "$expression"

