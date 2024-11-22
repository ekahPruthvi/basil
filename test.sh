#!/bin/bash

source "basil"

Line_sweep

Head_text "Bob(Header)"
echo ""
Form "hello can u make me pasta" "yes ig i can" "this is second BOB"

Fillaform "First parameter is Heading:" "This is fillable form," "Leave the heading black if u dont want heading" "you can give input in this and it'll be recoded"
printf "Enter choice here: "
read inp

Foot