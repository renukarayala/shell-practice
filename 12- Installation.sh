#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "ERROR:: Please run this script with root privelege"
  exit 1  # failure is other than 0
fi
rm -rf  nodejs -y




