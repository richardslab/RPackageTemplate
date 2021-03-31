#!/bin/bash
set -eux

echo arguments are: "$@"
echo first argument is "$1"
evaluated_args=($(eval "echo $@"))
echo conda run -n Template --no-capture-output ${evaluated_args[@]}
conda run -n Template --no-capture-output ${evaluated_args[@]}