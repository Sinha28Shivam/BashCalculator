calculate() {
  result=$(echo "$*" | bc -l)

  # timestamp
  #ts=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$*" = "$result" >> calculations.txt
  # display result in a dialog box
  dialog --title "Calculation Result" --msgbox "Result: $result" 8 40
}

# function to display the recent calculations
recent() {
result=""

if [ -f calculations.txt ];
  then
  while read -r line;
  do
    result+="\n$line"
  done < calculations.txt
fi

# display recent calculations in a dialog box
  dialog --title "Recent Calculations" --msgbox "$result" 20 80
  

}

