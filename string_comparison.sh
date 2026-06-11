#!/bin/bash

VARIABLE_ONE="10"
VARIABLE_TWO="20"

if [[ "${VARIABLE_ONE}" == "${VARIABLE_TWO}" ]]; then
 echo "They are equal!"
else
 echo "They are not equal!"
fi