#!/bin/bash

 USERID=$(id -u)  #The output is stored in variable USERID
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then  # If the user is not root (-ne 0), print an error and exit with code 1
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # Custom function to validate whether a command (like installation) was successful
    if [ $1 -ne 0 ]; then  # $1: exit status ($?)
        echo -e "Installing $2 ... $R FAILURE $N"  # -e means Escape codes work (colors, new lines, etc.) 
        # $2: name of the package and If fail → print RED message otherwise normal
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N"  # $2: name of the package and If success → print green message
    fi
}

dnf list installed mysql # Check if installed
# Install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y  # If not installed
    VALIDATE $? "MySQL" # Then call VALIDATE to print whether it succeeded or failed.
else
    echo -e "MySQL already exist ... $Y SKIPPING $N" #If already installed, print a SKIPPING message (with colored output using $Y and $N
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "Python3 already exist ... $Y SKIPPING $N"
fi