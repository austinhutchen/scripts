#!/bin/bash
./preprocess.sh |
    while IFS= read -r line
    do
        ./research.sh "$line" &
    done
