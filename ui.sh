#!/bin/bash

######################################################################################
# Basil is the backend UI toolkit for shell scripting                                #
# This file can be sourced and used for any shell script                             #
# CWRITE - ekahPruthvi                                                               #
######################################################################################

# Reset
clear='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
Pink='\033[0;95m'         # light Magenta

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White
BPink='\033[1;95m'        # light Magenta

# Thin
TBlack='\033[2;30m'       # Black
TRed='\033[2;31m'         # Red
TGreen='\033[2;32m'       # Green
TYellow='\033[2;33m'      # Yellow
TBlue='\033[2;34m'        # Blue
TPurple='\033[2;35m'      # Purple
TCyan='\033[2;36m'        # Cyan
TWhite='\033[2;37m'       # White
TPink='\033[2;95m'        # light Magenta

# Italics
SBlack='\033[3;30m'       # Black
SRed='\033[3;31m'         # Red
SGreen='\033[3;32m'       # Green
SYellow='\033[3;33m'      # Yellow
SBlue='\033[3;34m'        # Blue
SPurple='\033[3;35m'      # Purple
SCyan='\033[3;36m'        # Cyan
SWhite='\033[3;37m'       # White
SPink='\033[3;95m'        # light Magenta


# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White
UPink='\033[4;95m'       # light Magenta

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[7m'        # White
On_Pink='\033[105m'       # light Magenta

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
BIPink='\033[1;95m'       # light Magenta 

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

# Default Variables 
bg="$On_White"
ul="$UWhite"

# This is the header
Head_text() {
    local htext="$1"
    local hwidth=$(tput cols)
    local hpadding=$(( (hwidth - ${#htext}) / 2 ))
    local hendpad=$((( (hwidth - ${#htext}) / 2 )-1))
    printf "$On_White$BIWhite %${hpadding}s%s%${hendpad}s\n$clear" "" "$htext"
}

# This is the footer
Foot(){
    local COL=$(tput cols)
    local ROW=$(tput lines)
    tput cup $(( ROW - 1 ))
    local ftext="$(date) "
    local fwidth=$(tput cols)
    local fpadding=$(( (fwidth - ${#ftext})-15))
    printf "$On_White$BIWhite %${fpadding}s%s$clear" "" "Press Enter | $ftext"
}

# Display the text in center
Center_text() {
    local ctext="$1"
    local cwidth=$(tput cols)
    local cpadding=$(( (cwidth - ${#ctext}) / 2 ))
    printf "%${cpadding}s%s \n" "" "$ctext"
}

# Animation and clear screen
Line_sweep(){
    sleep 0.01
    [[ $LINES ]] || LINES=$(tput lines)
    [[ $COLUMNS ]] || COLUMNS=$(tput cols)
    tput civis
    for (( i=0; i<$LINES; i++ ))
    do
    clear
    if [ $i -gt 0 ]
    then
    n=$(($i-1))
    eval printf "$'\n%.0s'" {0..$n}
    fi
    eval printf %.1s '$((RANDOM & 1))'{1..$COLUMNS}
    sleep 0.01
    done
    clear
    tput cnorm
}

# This is a form, and it is customizable changing colors and the underline
# To edit teh colors, pls chnage the color variables (bg and ul)
# The Form has a min padding threshold of 50 charecters

Form(){
    local lineno="$#"
    local max=50
    for i in "$@"
    do      
        local temp="$i"
        local wc=${#temp}
        if [ "$wc" -gt "$max" ]
        then
            max="$wc"
        fi
    done
    max=$(($max+5))
    local fwidth=$(tput cols)
    local fpadding=$(( (fwidth - ${max}) / 2 ))
    local fendpad=$((( (fwidth - ${max}) / 2 )-1))
    local finstartpadd=2
    local finendpadd=2
    local cont=0
    echo ""
    for i in "$@"
    do
        local end="║"
        if [ "$cont" -eq 0 ]
        then
            end="╗"
        fi
        cont=$(($cont+1))
        temp="$i"
        wc=${#temp}
        finendpadd=$(( ($max-$wc)-5 ))
        printf "%${fpadding}s$bg$ul %${finstartpadd}s %s%${finendpadd}s$clear" "" "$temp"
        echo "$end"
        local fline="╚"
        if [ "$cont" -eq "$lineno" ]
        then 
            printf "%${fpadding}s"
            for f in $(seq 1 "$((max - 2 ))" )
            do
                if [ "$f" -eq "$(( max - 2 ))" ]
                then
                    fline="╝"
                fi
                printf "$fline"
                fline="═"
            done
        fi
    done
}

Fillaform(){
    local lineno="$#"
    local max=0
    for i in "$@"
    do      
        local temp="$i"
        local wc=${#temp}
        if [ "$wc" -gt "$max" ]
        then
            max="$wc"
        fi
    done
    max=$(($max+5))
    local fwidth=$(tput cols)
    local fpadding=$(( (fwidth - ${max}) / 2 ))
    local fendpad=$((( (fwidth - ${max}) / 2 )-1))
    local cont=0
    echo ""
    echo ""
    for i in "$@"
    do
        local finstartpadd=2
        local finendpadd=2
        temp="$i"
        local end="║"
        if [ "$cont" -eq 0 ]
        then
            end="╗"
            
        fi
        cont=$(($cont+1))
        wc=${#temp}
        finendpadd=$(( ($max-$wc)-5 ))
        printf "%${fpadding}s$BIWhite %${finstartpadd}s %s%${finendpadd}s$clear" "" "$temp"
        echo "$end"
        local fline="╚"
        if [ "$cont" -eq "$lineno" ]
        then 
            printf "%${fpadding}s"
            for f in $(seq 1 "$((max - 2 ))" )
            do
                if [ "$f" -eq "$(( max - 2 ))" ]
                then
                    fline="╝"
                fi
                printf "$fline"
                fline="═"
            done
        fi
    done
    printf "\n %${fpadding}s"
}

Links(){
    printf "${UBlue}"
    local placeholder='\e]8;;'${1}'\e\\'${2}'\e]8;;\e\\'
    echo -e $placeholder
    printf "${clear}"
}

Linspace(){
    local lines="$1"
    for line in $(seq 0 "$1")
    do
        echo ""
    done
}

Tables(){
    num_rows="$1"
    num_columns="$2"
    local var="$3"
    declare -a rowh
    declare -a colh
    readarray tb <<< "$var"

}

Tables_show(){
    for ((i=0;i<num_rows;i++)) do
        echo "${colh[$i]} ${tb[$i]}"
    done
}

# ekahPruthvi - SCU
Line_sweep
# It is mandetory to give the color values if once chnaged, 
Head_text "BASIL DEMO"

# heading
printf "\n\n${BIWhite}UI built using basil ${clear}\nBasil is a UI Toolkit for writing Shell scripts\nThis is a demo to show the funtionality of basil\n"
printf "\nbasil uses ${UWhite}pesto${clear} it contains all the color variables\nThe color variables can be used to 
        change the basic attributes of the text(Bold, Italic, Underline)"
Linspace 2

# Centering text
Center_text "The Text can also be centered"
Center_text "Underlining or adding diffrent colors does not work while the text is centered"
Linspace 1

# Form demo
printf "${BWhite}${UWhite}FORMS${clear}\nForms has two attributes bg and ul\n ${TWhite}bg${clear} - This gives the background color for the form\n ${TWhite}ul${clear} - It can be used either to change The text color along with \n      the underline or ${BWhite}Remove the underline and use diffrent colors or text properties (Blod or Italic or Thin)${clear}\n"
Form "This is a Form" "and its color can be changed" "pesto doesn't work inside of forms" "By default if the values of bg and ul" "has not been changed then," "It stays in black text over white background\n"
Linspace 1

bg="$On_Cyan"
ul="$UBlack"
Form "Forms have fixed width" "but if The charecters exceed the limit, the width increases accordingly" "With diffrent colors Example" "And to showcase box width, It changes according to characters"
Linspace 1

Form "Testing retaing behaviour of Forms" "Here No color value hav been given" "so, The old values retain"
Linspace 2

bg="$On_Pink"
ul="$TBlack"
Form "No underline Form" "Pink form" "With faint black text and no underline"

# create new page___________________________________________________________________________________________________
Foot && read && Line_sweep

Head_text "Second Page"
Linspace 2

Center_text "Page to Show Fillable Forms"

#Fillaform demo
Fillaform "First parameter is Heading:" "   " "This is fillable form," "Give three black spaces if u want to give linespace" "you can give input in this and it'll be recoded" 
printf "Enter choice here: "
read inp
Linspace 3

printf "This is the basic format for writing a ${TWhite}.pesto${clear} file\nIt is recomended to give ${TWhite}Linspace${clear} after every form\n"
printf "And to make blocks for each widget,\nEach block contains - The color variables(${TWhite}bg,ul${clear})\n\t\t      Widget(${TWhite}Form or Fillaform${clear}) And Widget(${TWhite}Form or Fillaform${clear})\n\t\t      And Linspace."
Linspace 1

printf "Links are simple widgets which display a link with alt text.\nBy default links are in blue color and underlined to diffrentiate them.\n"
Links "https://github.com/ekahPruthvi" "This is a link"

Linspace 3

# creating new page___________________________________________________________________________________________________
Foot && read && Line_sweep

Head_text "Third page"
Linspace 2

Center_text "Page to demonstrate tables"


rowh=("first" "second" "third" "fourth")
colh=("yes" "no" "maybe" "somthing")
alpharaw='a,b,c,d
e,f,g
h,i,,k
l,,n,o'
Tables 4 5 "$alpharaw"
Tables_show

Foot && read && pkill kitty