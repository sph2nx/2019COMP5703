#!/bin/bash

for i in $(seq 0 4)
do
    for j in $(seq 2 50)
    do
        aws s3 cp /home/ubuntu/pcap/$i-%j.pcap s3://usyd2019comp5703/training/pcap/%i/
        aws s3 cp /home/ubuntu/txt/$i-%j.txt s3://usyd2019comp5703/training/txt/%i/
    done
done
