#!/bin/bash
set -x                    # Enable command tracing
bash --version            # Show Bash version
env                       # Display environment variables
echo ${SHELL}             # Show current shell
echo ${RANDOM}            # Generate a random number
echo ${UID}               # Show current user ID
echo ${OSTYPE}            # Show operating system type
ps -ef                    # List all running processes
bash -r blackhatbash1.sh  # Run script in restricted Bash
bash -n blackhatbash1.sh  # Check script syntax
bash -n blackhatbash1.sh  # Check script syntax again
man ls                    # Open ls manual page