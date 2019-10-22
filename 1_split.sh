#!/bin/bash

# This shell script file will download a url list, and split urls to different
# line. Each line will have one url. Finally, export the result to SplitedUrlList.txt

wget -O UrlList.txt https://github.com/DistriNet/DLWF/blob/master/keras-dlwf/closed_world.py

cat UrlList.txt | awk -F, '{for(i=1;i<=NF;i++){print $i;}}' | while read line
do
    echo $line | cut -d "'" -f 2 >> SplitedUrlList.txt
done
