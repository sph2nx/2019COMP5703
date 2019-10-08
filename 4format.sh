#!/bin/bash

for i in $(seq 21 30)
do
    tshark -r /home/lat/Desktop/pcap/$i.pcap -Y ssl -F k12text -w /home/lat/Desktop/txt/$i.txt
done
