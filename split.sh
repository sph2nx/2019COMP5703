#!/bin/bash

cat FullList.txt | awk -F, '{for(i=1;i<=NF;i++){print $i;}}' | while read line
do
    echo $line | cut -d "'" -f 2 >> split.txt
done

cat split.txt | tail -n +1 | head -n 100 > split.txt
