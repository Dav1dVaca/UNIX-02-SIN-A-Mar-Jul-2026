#!/bin/bash
# Store the first command-line argument in a variable.
USER_INPUT="${1}"

# Check whether an argument was provided.
# If no argument is given, display an error message and terminate the script.
if [[ -z "${USER_INPUT}" ]]; then
    echo "You must provide an argument!"
    exit 1
fi

# Determine the type of the provided argument.
# First, check if it is a file.
# If not, check if it is a directory.
# Otherwise, indicate that it is neither a file nor a directory.
if [[ -f "${USER_INPUT}" ]]; then
    echo "${USER_INPUT} is a file."
elif [[ -d "${USER_INPUT}" ]]; then
    echo "${USER_INPUT} is a directory."
else
    echo "${USER_INPUT} is not a file or a directory."
fi