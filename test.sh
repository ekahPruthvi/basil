#!/bin/bash

source "basil"

Line_sweep

# It is mandetory to give the color values if once given, i.e. If The color bvalues have been changed once then for changing it again The color values hav to be given
bg="$On_White"
ul="$UWhite"
Head_text "Bob(Header)"
echo ""
Form "hello can u make me pasta" "yes ig i can" "this is second BOB"

Linspace 1

bg="$On_Yellow"
ul="$UBlack"
Form "Multiple forms with" "With diffrent colors Example"

Form "testing" "Here No color value hav been given," "so The old values retain"
Linspace 2

Fillaform "First parameter is Heading:" "   " "This is fillable form," "Give three black spaces if u want to give linespace" "you can give input in this and it'll be recoded" 
printf "Enter choice here: "
read inp

Linspace 3

Foot && read && pkill kitty