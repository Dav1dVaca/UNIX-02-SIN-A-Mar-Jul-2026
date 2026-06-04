#!/bin/bash                   
book="black hat bash"          # Store book title
echo "This book's name is ${book}"  # Display book title

root_directory=$(ls -ld /)     # Get root directory details
echo "${root_directory}"       # Display root directory information