#!/bin/bash

cat url.txt | awk -F, '{for(i=1;i<=NF;i++){print $i;}}' | while read line
do
    echo $line | cut -d "'" -f 2 >> split.txt    
done
