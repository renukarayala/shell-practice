#!/bin/bash

echo "Please enter number"
read NUMBER
NUMBER=$1-$100
if [ $(($NUMBER % 2)) -nq 0 ]; then
   echo "Given number is Prime number"
 else
   echo "Given number is not prime number"  

elseif [ $NUMBER -lt 10 ]; then
    echo "Given number $NUMBER is less than 10"
elif [ $NUMBER -eq 10 ]; then
    echo "Given number $NUMBER is equal to 10"
else
    echo "Given number $NUMBER is greater than to 10"
fi