#!/bin/bash
set -eux

echo arguments are: "$@"
echo first argument is "$1"
evaluated_args=($(eval "echo $@"))
echo conda run -n Template --no-capture-output ${evaluated_args[@]}
echo $@
all=$(echo "$@")
echo ${all[@]}
conda run -n Template --no-capture-output ${evaluated_args[@]}