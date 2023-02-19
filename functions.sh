
Normal_Calculation() {
    operator_options=(1 "Addition"
                      2 "Subtraction"
                      3 "Multiplication"
                      4 "Division"
                      5 "Modulo(%)"
                      6 "power"
                      7 "Square root"
                      8 "Bodmas")

    operator=$(dialog --title "Normal Calculation" --menu "Please select an operator:" 15 50 6 "${operator_options[@]}" 2>&1 >/dev/tty)
    
    
    if (( $operator >= 1 && $operator <= 6 )); 
    then

    
    num1=$(dialog --title "Normal Calculation" --inputbox "Enter the first number:" 10 30 2>&1 >/dev/tty)
    num2=$(dialog --title "Normal Calculation" --inputbox "Enter the second number:" 10 30 2>&1 >/dev/tty)
    
    
      # check if  the input is number or not
      if ! number "$num1" || ! number "$num2";
      then
      dialog --title "Error"  --msgbox "Invlid input: $num1 and $num2 is not a number" 10 30
      return 1
      fi
    	
    elif (( $operator == 7 ));
    then
    #check if the input is number or not
        num3=$(dialog --title "Normal Calculation" --inputbox "Enter the number:" 10 30 2>&1 >/dev/tty)
        if ! number "$num3";
      then
      dialog --title "Error"  --msgbox "Invlid input: $num3 is not a number" 10 30
      return 1
      fi
      elif (( $operator == 8));
      then
        expression=$(dialog --title "Normal Calculation" --inputbox "Enter an expression using BODMAS:" 10 50 2>&1 >/dev/tty)

        # perform the BODMAS calculation using printf and bc commands
        result=$(printf "%.3f\n" $(echo "$expression" | bc -l))
    else
        dialog --title "Error" --msgbox "Invalid operator" 20 50
        exit 1
        
    fi



    case $operator in
      1)
        result=$(echo "$num1 + $num2" | bc -l)
        ;;
      2)
        result=$(echo "$num1 - $num2" | bc -l)
        ;;
      3)
        result=$(echo "$num1 * $num2" | bc -l)
        ;;
      4)
        result=$(echo "$num1 / $num2" | bc -l)
        ;;
      5)
        result=$(echo "($num1 / $num2)*100" | bc -l)
        ;; 
      6)
       result=$(echo "($num1^$num2)" | bc -l)
       ;; 
      7)
       result=$(echo "scale=4; sqrt($num3)" | bc)
       ;;
      8)
      
      ;; 
       
      *)
        dialog --title "Error" --msgbox "Invalid operator" 20 50
        exit 1
        ;;
    esac
   dialog --title "Result" --msgbox "Result: $result" 10 30
  

}
# this will check the input is number or not
number() {
    echo "$@" | grep -qve '^[-+]?[0-9]+\.?[0-9]*$'
    }

