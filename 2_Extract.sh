#!/bin/bash

# Extract needed website urls according to website number. The first website is marked as 0.

# Modify following parameters.
start=0
end=9

cat 1_SplitUrls.txt | tail -n +$(($start+1)) | head -n +$(($end-$start+1)) > 2_ExtractUrls.txt
