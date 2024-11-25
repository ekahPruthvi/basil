#!/bin/bash

source "basil"

Line_sweep

Head_text "Bob(Header)"
echo ""
Form "hello can u make me pasta" "yes ig i can" "this is second BOB"

Fillaform "First parameter is Heading:" "   " "This is fillable form," "Give three black spaces if u want to give linespace" "you can give input in this and it'll be recoded" 
printf "Enter choice here: "
read inp

Linspace 3

Foot && read