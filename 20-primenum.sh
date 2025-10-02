#!/bin/bash

check_prime() {
  NUMBER=$1

  if [ "$NUMBER" -lt 100 ]; then
    echo "$NUMBER is a Prime Number"
  else
    echo "$NUMBER is NOT a Prime Number"
  fi
}
