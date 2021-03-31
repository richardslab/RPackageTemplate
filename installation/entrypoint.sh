#!/bin/bash
echo arguments are: "$@"
echo first argument is "$1"
eval evaluated_args="$@"
echo conda run -n Template --no-capture-output $evaluated_args
conda run -n Template --no-capture-output $evaluated_args