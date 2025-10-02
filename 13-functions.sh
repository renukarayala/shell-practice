#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
else
    echo "working with root"    
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python3"

# VALIDATE() is a custom function to check the exit status of the previous command.

# $1 is the first argument passed to the function: expected to be the exit code (usually $?).

# $2 is the second argument, a string representing the name of the package or task.

# The function checks:

# If the exit code is not zero (-ne 0), it means the command failed, so it:

# Prints an error message

# Exits the script (exit 1)

# If the exit code is zero, it means the command succeeded, so it:

# Prints a success message

# Each dnf install ... -y command installs a package non-interactively (without asking for confirmation).

# dnf install mysql -y: Install MySQL

# VALIDATE $? "MySQL":

# $? captures the exit status of the previous dnf command

# Calls VALIDATE with that status and the name "MySQL"

# This pattern is repeated for:

# nginx

# python3