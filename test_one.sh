#!/bin/bash

read prob_num
cd ./$prob_num
g++ -o main $prob_num.cpp
./main