#!/bin/bash

let result="4 * 5"    # Perform arithmetic operation
echo ${result}        # Display result
result=$((5 * 5))   # Perform arithmetic operation
echo ${result}      # Display result
result=$(expr 5 + 505)  # Calculate expression
echo ${result}          # Display result