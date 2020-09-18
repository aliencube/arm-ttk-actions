#!/bin/bash

set -e

# List of args
# -TemplatePath => $1
# -File => $2
# -Test => $3
# -Skip => $4

_args="-TemplatePath '$1'"

[ "$2" ] && _args="$_args -File '$2'"
[ "$3" ] && _args="$_args -Test '$3'"
[ "$4" ] && _args="$_args -Skip '$4'"

echo "Running: sh /arm-ttk/arm-ttk/Test-AzTemplate.sh $_args"
results=$(sh /arm-ttk/arm-ttk/Test-AzTemplate.sh $_args)

echo "Results: $results"

# Processes the escape characters
# https://github.com/actions/create-release/issues/25
results="${results//$'%'/'%25'}"
results="${results//$'\n'/'%0A'}"
results="${results//$'\r'/'%0D'}"

# Sets the output
echo "::set-output name=results::$results"
