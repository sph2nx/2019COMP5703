#!/bin/bash

# Format pcap files to txt and upload to AWS S3.

# Modify the following parameter.
istart=0
iend=1
jstart=1
jend=5

for i in $(seq $istart $iend)
do
    for j in $(seq $jstart $jend)
    do
        istr=$(printf "%03d" "$j")
        jstr=$(printf "%04d" "$j")
        tshark -r $HOME/pcap/$istr-$jstr.pcap -Y ssl -F k12text -w $HOME/txt/$istr-$jstr.txt
        aws s3 cp $HOME/pcap/$istr-$jstr.pcap s3://usyd2019comp5703/training/pcap/$istr/
        aws s3 cp $HOME/txt/$istr-$jstr.txt s3://usyd2019comp5703/training/txt/$istr/
    done
done
