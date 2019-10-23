#!/bin/bash

# Capture web browser data through tcpdump.

# Modify following parameters. The files will be named as "i-j.pcap".
# i indicates the website number.
# j indicates the repeat times.
istart=-1
jstart=1
jend=100

cat 2_ExtractUrls.txt | tr -s '\n' | while read line
do
    istart=$(($istart+1))
    for j in $(seq $jstart $jend)
    do
        istr=$(printf "%03d" "$istart")
        jstr=$(printf "%04d" "$j")
        sudo tcpdump -w $HOME/pcap/$istr-$jstr.pcap &
        exec $HOME/tor-browser_en-US/Browser/start-tor-browser $line || exit 1 &
        sleep 45
        ps -ef|grep TorBrowser|grep -v grep|cut -c 10-14|xargs kill -s 15
        ps -ef|grep TorBrowser|grep -v grep|cut -c 10-14|xargs kill -s 9
        ps -ef|grep tcpdump|grep -v grep|cut -c 10-14|xargs sudo kill -s 2
        sleep 15
    done
done
