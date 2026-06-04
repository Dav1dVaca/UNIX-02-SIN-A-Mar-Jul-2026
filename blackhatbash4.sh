#!/bin/bash

PUBLISHER="No Starch Press"    # Define global variable

print_name(){                  # Define function
    local name                 # Declare local variable
    name="Black Hat Bash"      # Assign book title
    echo "${name} by ${PUBLISHER}"  # Print title and publisher
}

print_name                     # Call function

echo "Variable ${name} will not be printed because it is a local variable."  # Demonstrate local scope
