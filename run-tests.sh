#! /bin/bash
# This file compiles and tests the code against the created test-cases

file=$1
shift
tests=$1
shift
while [ $# -ne 0 ]; do
  specifications="$specifications $1"
done

$(clang ${specifications} ${file} -o compiled)
for files in $(cat $tests); do
      TEMPFILE=$(mktemp)
      compiled < ${files}.in > TEMPFILE
      if [ "$(diff $TEMPFILE ${files}.expect)" != "" ]; then
        echo "Test Failed: $files"
        echo "Input:"
        cat ${files}.in > echo
        echo "Output:"
        cat $TEMPFILE > echo
        echo "Exected Output:"
        cat ${files}.out > echo
        echo "------"
      else
        echo "Test Passed: $files"
        echo "Input:"
        cat ${files}.in > echo
        echo "Output:"
        cat $TEMPFILE > echo
      fi
      rm $TEMPFILE
done
