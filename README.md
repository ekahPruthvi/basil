
# Basil

WIP project ⚠️

Basil is a UI library for bash, similar to ncurses
presently it has very less widgets more are yet to come as this project is still wip.

it uses a simple format called pesto similar to shell.
(written on bash)

pesto is compiled into a usable shell script by `cook`



## widgets

### Head_text()

In normal mode it is used to display a header text.
but in retro and b&w it uses predefined headers.

```
Head_text "BASIL DEMO"
```

### Foot()

It creates the footer at the end of the console.

```
Foot
```

### Line_sweep()

It is an animation for clearing the screen.

```
Line_sweep
```

### Linspace()

Used for giving line spaces, takes intger as argument

```
Linspace 3
```
this gives 3 line spaces

### Center_text()

Centers text in the console

``` 
Center_text "This text is centered"
```

### Form()

Used to make form(boxes) with text inside.

each paramenter is one line
```
Form "first line" "second line"
```

### Fillaform()

Fillaform is used to make form(boxes) with input support.

```
Fillaform "First parameter is Heading:" "   " "Give three black spaces if u want to give linespace" 
printf "Enter choice here: "
read input
```
This is the recomended way to write a Fillaform

### Links()

Clickable links can be added using Links widget

```
Links "https://github.com/ekahPruthvi" "This is a link"
```

## Pesto

> Pesto is the inhouse recomended format for writing for basil.

- `Linspace 2` after every widgets
- use comments
- use `bg = $color` for background color (for colors refer colorname)
- `ul = $color` can be used for type of attribute for the text, like color, bold, underlined, etc (refer to colorname)
- to create pages use : ```Foot && read && Line_sweep```


### Example

![image](https://github.com/user-attachments/assets/5a439cae-74f1-44d3-a639-b97a218979aa)

![image](https://github.com/user-attachments/assets/1cb4ec8b-a915-4bf8-8616-d2c7b9f1c896)



```bash
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
Linspace 1

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

Foot && read && pkill kitty
```


## Installation

- To install Basil clone the repository and run install.sh
```bash
git clone https://github.com/ekahPruthvi/basil.git
cd basil
./install.sh
```

### Uninstallation
```
cook -del
```

It will ask for conformation and the uninstall basil completely.

## Usage

After writing the pesto file, The pastas have to be cooked ;)

to cook goto your terminal/console and use cook.

```
cook [option] <file.pesto>
```
use only `cook` for the help message

>example:\
>        cook "~/Documents/example.pesto"\
>or\
>        cook -r "example.pesto"

This will return `ui.sh` in the working directory which can be run directly!!


## Colorname

| Color             | Variable Name                                                               |
|-----------------|------------------------------------------------------------------|
| Black             | `Black`                                                                   |
| Red               | `Red`                                                                     |
| Green             | `Green`                                                                   |
| Yellow            | `Yellow`                                                                  |
| Blue              | `Blue`                                                                    |
| Purple            | `Purple`                                                                  |
| Cyan              | `Cyan`                                                                    |
| White             | `White`                                                                   |
| Pink              | `Pink`                                                                    |
| Black (Bold)      | `BBlack`                                                                  |
| Red (Bold)        | `BRed`                                                                    |
| Green (Bold)      | `BGreen`                                                                  |
| Yellow (Bold)     | `BYellow`                                                                 |
| Blue (Bold)       | `BBlue`                                                                   |
| Purple (Bold)     | `BPurple`                                                                 |
| Cyan (Bold)       | `BCyan`                                                                   |
| White (Bold)      | `BWhite`                                                                  |
| Pink (Bold)       | `BPink`                                                                   |
| Black (Thin)      | `TBlack`                                                                  |
| Red (Thin)        | `TRed`                                                                    |
| Green (Thin)      | `TGreen`                                                                  |
| Yellow (Thin)     | `TYellow`                                                                 |
| Blue (Thin)       | `TBlue`                                                                   |
| Purple (Thin)     | `TPurple`                                                                 |
| Cyan (Thin)       | `TCyan`                                                                   |
| White (Thin)      | `TWhite`                                                                  |
| Pink (Thin)       | `TPink`                                                                   |
| Black (Italics)   | `SBlack`                                                                  |
| Red (Italics)     | `SRed`                                                                    |
| Green (Italics)   | `SGreen`                                                                  |
| Yellow (Italics)  | `SYellow`                                                                 |
| Blue (Italics)    | `SBlue`                                                                   |
| Purple (Italics)  | `SPurple`                                                                 |
| Cyan (Italics)    | `SCyan`                                                                   |
| White (Italics)   | `SWhite`                                                                  |
| Pink (Italics)    | `SPink`                                                                   |
| Black (Underline) | `UBlack`                                                                  |
| Red (Underline)   | `URed`                                                                    |
| Green (Underline) | `UGreen`                                                                  |
| Yellow (Underline)| `UYellow`                                                                 |
| Blue (Underline)  | `UBlue`                                                                   |
| Purple (Underline)| `UPurple`                                                                 |
| Cyan (Underline)  | `UCyan`                                                                   |
| White (Underline) | `UWhite`                                                                  |
| Pink (Underline)  | `UPink`                                                                   |
| Black (Background)| `On_Black`                                                                 |
| Red (Background)  | `On_Red`                                                                   |
| Green (Background)| `On_Green`                                                                 |
| Yellow (Background)| `On_Yellow`                                                                |
| Blue (Background) | `On_Blue`                                                                   |
| Purple (Background)| `On_Purple`                                                                 |
| Cyan (Background) | `On_Cyan`                                                                   |
| White (Background)| `On_White`                                                                 |
| Pink (Background) | `On_Pink`                                                                   |
| Black (High Intensity) | `IBlack`                                                                   |
| Red (High Intensity)  | `IRed`                                                                     |
| Green (High Intensity) | `IGreen`                                                                   |
| Yellow (High Intensity) | `IYellow`                                                                  |
| Blue (High Intensity)  | `IBlue`                                                                    |
| Purple (High Intensity) | `IPurple`                                                                  |
| Cyan (High Intensity)  | `ICyan`                                                                    |
| White (High Intensity) | `IWhite`                                                                   |
| Black (Bold High Intensity) | `BIBlack`                                                                  |
| Red (Bold High Intensity)  | `BIRed`                                                                    |
| Green (Bold High Intensity) | `BIGreen`                                                                  |
| Yellow (Bold High Intensity) | `BIYellow`                                                                 |
| Blue (Bold High Intensity)  | `BIBlue`                                                                   |
| Purple (Bold High Intensity) | `BIPurple`                                                                 |
| Cyan (Bold High Intensity)  | `BICyan`                                                                   |
| White (Bold High Intensity) | `BIWhite`                                                                  |
| Pink (Bold High Intensity) | `BIPink`                                                                   |
| Black (High Intensity Background) | `On_IBlack`                                                                 |
| Red (High Intensity Background)  | `On_IRed`                                                                   |
| Green (High Intensity Background) | `On_IGreen`                                                                 |
| Yellow (High Intensity Background) | `On_IYellow`                                                                |
| Blue (High Intensity Background)  | `On_IBlue`                                                                   |
| Purple (High Intensity Background) | `On_IPurple`                                                                 |
| Cyan (High Intensity Background)  | `On_ICyan`                                                                   |
| White (High Intensity Background) | `On_IWhite`                                                                   |

