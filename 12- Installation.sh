#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "ERROR:: Please run this script with root privelege"
  exit 1  # failure is other than 0
else
    echo "worked with root"  
fi
dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing nodejs is failure"
    exit 1
else
    echo "Installing nodejs is SUCCESS"
fi


