#!/bin/bash

# Define a function that checks whether the current user
# has root privileges by evaluating the effective user ID (EUID).
check_if_root() {
    if [[ "${EUID}" -eq "0" ]]; then
        return 0
    else
        return 1
    fi
}

# Call the function and display a message based on its result.
# A return value of 0 indicates that the user is root,
# while any other value indicates a non-root user.
if check_if_root; then
    echo "User is root!"
else
    echo "User is not root!"
fi