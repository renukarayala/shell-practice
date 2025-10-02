#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$G Hello World $N"
echo "Check this color"

# -e: enables escape sequences in echo

# \e → escape character (used for color codes)

# \n → new line

# \t → tab

# \\ → backslash

# $G: applies green color

# "Hello World": the text to print

# $N: resets the color back to normal

# BLACK="\e[30m"
# RED="\e[31m"
# GREEN="\e[32m"
# YELLOW="\e[33m"
# BLUE="\e[34m"
# MAGENTA="\e[35m"
# CYAN="\e[36m"
# WHITE="\e[37m"

# # Reset
# RESET back to normal="\e[0m"