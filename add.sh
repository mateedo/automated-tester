#! /bin/bash
# This script is an add function which let's you add a test-case
#

echo "$1" > test-cases.txt
touch ${1}.in
touch ${1}.out

echo "$2" > ${1}.in
echo "$3" > ${1}.out
