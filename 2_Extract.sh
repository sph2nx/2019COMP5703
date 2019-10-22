#!/bin/bash

# Extract needed website urls according to line number.

# Modify following parameters.
start=1
end=5

cat split.txt | tail -n +$start | head -n +$end > 2_ExtractedUrls.txt
