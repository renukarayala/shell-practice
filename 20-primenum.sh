#!/bin/bash

echo "Please enter number"
read NUMBER

if is_prime "$NUMBER"; then
    echo "Given number is a Prime number"
else
    echo "Given number is NOT a Prime number"
fi




