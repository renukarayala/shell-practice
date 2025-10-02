#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"   # LOGS_FOLDER is where logs will be stored.
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 ) # $0 script name 16-log
   #cut splits the string using . (dot) as the delimiter (-d ".").-f1 tells it to return the first part (field) before the dot.
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log 
# LOG_FILE defines the path where logs will be written
#SCRIPT_NAME extracts the script’s name by stripping off the extension (e.g., myscript.sh → myscript).

LOG_FILE defines the path where logs will be written:
/var/log/shell-script/<script_name>.log

mkdir -p $LOGS_FOLDER  # -p if folder is not it will create otherwise keep silent
echo "Script started executed at: $(date)" | tee -a $LOG_FILE #tee -a both prints it to the terminal and appends it to the log file.

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

dnf list installed mysql &>>$LOG_FILE
# Install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "Python3 already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE # tee command useful for print in logfile also
fi


# $1 -> success
# $2 -> failure
# $& -> success/failure