
number() {
re='^[0-9]+$'
if ! [[ $1 =~ $re ]];
then
return 1
fi
return 0
}




Scientific_Calculation() {
    function_options=(1 "Trignometric Function"
       		      2 "Area of Rectangle"
       		      3 "break")

     function=$(dialog --title "Scientific Calculation" --menu "Please select a function:" 15 50 3 "${function_options[@]}" 2>&1 >/dev/tty)

     if [ $function -eq 1 ]; 
     then
      trig_options=(1 "sin"
                    2 "cos"
                    3 "tan")

      trig=$(dialog --title "Trignometric Function" --menu "Please select a trignometric function:" 15 50 4 "${trig_options[@]}" 2>&1 >/dev/tty)

      angle=$(dialog --title "Trignometric Function" --inputbox "Enter the angle (in radian):" 10 30 2>&1 >/dev/tty)
      
      
      #check the nubmer is a number or not
      if ! number "$angle";
      then
      dialog --title "Error"  --msgbox "Invlid input: $angle is not a number" 10 30
      return
      fi
      
      
      
      
    case $trig in
     1)
      result=$(echo "s($angle)" | bc -l)
      dialog --title "Result" --msgbox "Result: $result" 10 30
      ;;
     2)
      result=$(echo "c($angle)" | bc -l)
      dialog --title "Result" --msgbox "Result: $result" 10 30
      ;;
     3)
      result=$(echo "s($angle)/c($angle)" | bc -l)
      dialog --title "Result" --msgbox "Result: $result" 10 30
      ;;
    
    esac
    
    elif [ $function -eq 2 ];
    then
   length=$(dialog --title "Trignometric Function" --inputbox "Enter the length of the rectangle:" 10 30 2>&1 >/dev/tty)
   width=$(dialog --title "Trignometric Function" --inputbox "Enter the width of the rectangle" 10 30 2>&1 >/dev/tty)
   
   # if echo "$length $width" | grep -qve '^[0-9]\+\(\.[0-9]\+\)\?$'; then
    #        dialog --title "Error" --msgbox "Invalid input: please enter numbers only" 20 50
     #       return 1
      #  fi
   
   
    result=$(echo "$length*$width" | bc)
     dialog --title "Result" --msgbox "Area of Rectangle: $result" 10 30
     
   elif [ $function -eq 3 ];
        then
            break
fi

}
