#! /bin/bash
# This file takes in a test name and removes it

rm ${1}.in
rm ${1}.out
TEMPFILE=$(mktemp)
grep -v "^${1}$" test-cases.txt > echo > TEMPFILE
rm test-cases.txt
touch test-cases.txt
cat nul > echo > test-cases.txt
rm TEMPFILE
