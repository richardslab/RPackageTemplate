#!/bin/bash

INPUT=("$@")

for index in "${!INPUT[@]}"; do  
	printf 'input[%i] = %s\n' $index "${INPUT[$index]}";  
done

conda run -n Template --no-capture-output "${INPUT[@]}"