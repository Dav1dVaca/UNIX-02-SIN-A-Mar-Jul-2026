#!/bin/bash
FILENAME="flow_control_with_if.txt"

if [[ -f "${FILNAME}" ]]; then
    echo "${FILENAME} already exist"
    exit 1
else
    touch "${FILENAME}"
fi 