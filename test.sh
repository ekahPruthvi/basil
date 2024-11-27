#!/bin/bash

source "basil"

Line_sweep

# It is mandetory to give the color values if once given, 
# i.e. If The color bvalues have been changed once then for changing it again The color values hav to be given
bg="$On_White"
ul="$UWhite"
Head_text "BASIL DEMO"

# heading
printf "\n\n${BIWhite}UI built using basil ${clear}\nBasil is a UI Toolkit for writing Shell scripts\nThis is a demo to show the funtionality of basil\n"
printf "basil uses ${UWhite}pesto${clear} it contains all the color variables\n The color variables can be used to change the basic attributes of"
Linspace 2

# Centering text
Center_text "The Text can also be centered"
Center_text "Underlining or adding diffrent colors does not work while the text is centered"
Linspace 1

# Form demo
printf "${BWhite}${UWhite}FORMS${clear}\nForms has two attributes bg and ul\n ${TWhite}bg${clear} - This gives the background color for the form\n ${TWhite}ul${clear} - It can be used either to change The text color along with \n      the underline or ${BWhite}Remove the underline and use diffrent colors or text properties (Blod or Italic or Thin)${clear}\n"
Form "This is a Form" "This makes pastas" "and its color can be changed"

Linspace 1

bg="$On_Cyan"
ul="$UBlack"
Form "Multiple forms with" "With diffrent colors Example" "And to showcase box width, It changes according to characters"
Linspace 1

Form "testing" "Here No color value hav been given" "so, The old values retain"
Linspace 2

bg="$On_Pink"
ul="$UBlack"
Form "Testing" "Pink form" "With black text"

# create new page___________________________________________________________________________________________________
Foot && read && Line_sweep

Head_text "Second Page"

Linspace 2

Center_text "Page to Show Fillable Forms"
printf ""

#Fillaform demo
Fillaform "First parameter is Heading:" "   " "This is fillable form," "Give three black spaces if u want to give linespace" "you can give input in this and it'll be recoded" 
printf "Enter choice here: "
read inp

Linspace 3

Foot && read && pkill kitty