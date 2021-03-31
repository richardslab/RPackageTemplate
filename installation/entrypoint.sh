#!/bin/bash
echo arguments are: "${@[@]}"
echo first argument is "${@[0]}"
conda run -n Template --no-capture-output "${@[@]}"
