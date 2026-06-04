#!/bin/bash 
mkdir mydirectory        # Create directory
touch mydirectory/myfile # Create file

set -x                   # Enable command tracing
ls -l mydirectory        # List directory contents
set +x                   # Disable command tracing