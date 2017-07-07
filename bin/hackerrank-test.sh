#!/bin/bash

# Runs your application against HackerRank's test cases.
#
# Test cases and result files should reside inside the "tests" directory
# in form of "input*.txt" and "output*.txt" files.
# Your application should read all input data from the standart input.
# Tests directory location can also be specified with -t or --testdir flag.

TESTDIR=tests
LC_NUMERIC=C # for printf %f
FORMAT="%15s %15s %15f\n"

case "$1" in
    -t|--testdir)
    TESTDIR=$2
    shift 2
    ;;
esac

if [ "$#" == "0" ]; then
    echo "$0 [ -t TESTDIR ] COMMAND [ ARGS ]"
    exit 1
fi

for IFILE in $TESTDIR/input*; do
    NAME="${IFILE##*/}"
    NUM="${NAME##input}"
    OFILE="$TESTDIR/output$NUM"

    START=$(date +%s.%N)
    CMDOUT="$($@ < $IFILE)"
    END=$(date +%s.%N)
    TIME=$(echo "$END - $START" | bc)

    if [ -f "$OFILE" ]; then
        EXPOUT="$(<$OFILE)"

        if [ "$CMDOUT" == "$EXPOUT" ]; then
            RESULT="PASS"
        else
            RESULT="FAIL"
        fi
    else
        RESULT="NO ANSWER"
    fi

    printf "$FORMAT" "$NAME" "$RESULT" "$TIME"
    if [ "$RESULT" == "FAIL" ]; then
        echo "Result: $CMDOUT"
        echo "Expected: $EXPOUT"
        echo
    fi
done
