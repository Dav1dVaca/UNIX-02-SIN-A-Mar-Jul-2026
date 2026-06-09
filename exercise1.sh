#!/bin/bash
# Execute the script passing first name and last name as arguments
./exercise1.sh David Vaca

# Set execution permissions for the file
chmod +x exercise1.sh

#!/bin/bash

# Assign the arguments to variables
FIRST_NAME=$1
LAST_NAME=$2

# Create (or overwrite) the output.txt file
# Write the current date in DD-MM-YYYY format
date +"%d-%m-%Y" > output.txt

# Write the full name to output.txt (using >> to append to the end)
echo "$FIRST_NAME $LAST_NAME" >> output.txt

# Create a backup copy named backup.txt
cp output.txt backup.txt

# Print the content of the file to the standard output
cat output.txt