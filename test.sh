#!/bin/bash

prob_num=$1
echo "problem number: $prob_num"
cd ./$prob_num
g++ -o main $prob_num.cpp
if [ $# -eq 2 ] ; then
    ./main < $2
    echo ""
else
    if [ -e "testcase.txt" ]; then
        while read line || [ -n "$line" ] ; do
            ./main < "${line}_input.txt" > "temp_output"
            if diff "${line}_output.txt" "temp_output" ; then
                echo "correct"
            else
                echo "wrong"
            fi
        done < "testcase.txt"
    else
        number=1
        while :
        do
            if [ ! -e "${number}_input.txt" ]; then
                break
            fi
            ./main < "${number}_input.txt" > "temp_output"
            if diff "${number}_output.txt" "temp_output" ; then
                echo "correct"
            else
                echo "wrong"
            fi
            ((number++))
        done
    fi
    rm temp_output
fi
rm main
#echo -e $input_val
