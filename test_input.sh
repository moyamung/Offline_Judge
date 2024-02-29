#!/bin/bash

prob_num=$1
echo "problem number: $prob_num"
input_val='cat input.txt'
cd ./$prob_num
g++ -o main $prob_num.cpp
./main < ./input.txt
#echo -e $input_val
