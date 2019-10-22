#!/bin/bash

# This shell script file will download a url list, and split urls to different
# line. Each line will have one url.

wget -O 1_OriginalUrls.txt -q https://raw.githubusercontent.com/DistriNet/DLWF/master/keras-dlwf/closed_world.py

cat 1_OriginalUrls.txt | awk -F, '{for(i=1;i<=NF;i++){print $i;}}' | while read line
do
    echo $line | cut -d "'" -f 2 >> 1_SplitedUrls.txt
done
