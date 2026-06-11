#!/bin/bash

FILENAME="flow_control_with_if1.txt"
# shellcheck disable=SC1033
if [[ ! -f "${FILENAME}" ]]; then
 touch "${FILENAME}"
fi
