#!/bin/bash

# Extract needed website urls according to line number.

# Modify following parameters.
start=1
end=10

cat 1_SplitedUrls.txt | tail -n +$start | head -n +$end > 2_ExtractedUrls.txt
