#! /bin/bash
# Start a loop that iterates through all files whose names begin with "example_file"
for file in example_file*; do

    # Check if the current file is exactly named "example_file1"
    if [[ "${file}" == "example_file1" ]]; then

        # Display a message indicating that the first file will be skipped
        echo "Skipping the first file"

        # Skip the rest of the loop body and continue with the next file
        continue
    fi

    # Generate a random number and write it to the current file,
    # replacing any existing content in that file
    echo "${RANDOM}" > "${file}"

# End of the loop
done