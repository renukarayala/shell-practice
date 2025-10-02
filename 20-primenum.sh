#!/bin/bash

echo "Please enter number"
read -p "Enter a number: " $NUMBER

if [ $NUMBER ]; then
    echo "Given number is a Prime number"
else
    echo "Given number is NOT a Prime number"
fi




