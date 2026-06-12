#!/bin/bash
# Name of the file that will be used as a signal to stop the loop
SIGNAL_TO_STOP_FILE="stoploop"

# Keep looping while the file does NOT exist
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do

    # Display a message indicating that the file has not been found yet
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."

    # Inform the user that the script will check again after 2 seconds
    echo "Checking again in 2 seconds..."

    # Pause the script for 2 seconds before the next check
    sleep 2

# End of the while loop
done

# Display a message when the file is found and the loop ends
echo "File was found! Exiting..."