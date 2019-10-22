#!/bin/bash

# Format pcap files to txt.

# Modify the following parameter.
istart=0
iend=1
jstart=1
jend=5

for i in $(seq $istart $iend)
do
    for j in $(seq $jstart $jend)
    do
        tshark -r $HOME/pcap/$istr-$jstr.pcap -Y ssl -F k12text -w $HOME/txt/$istr-$jstr.txt
    done
done
