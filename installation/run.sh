#!/bin/bash
echo "in run.sh"
echo "arguments are: " "$@"
echo "$PATH"
exec "$@"
