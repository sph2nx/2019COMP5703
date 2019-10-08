#!/bin/bash

i=-1
cat extract.txt | tr -s '\n' | while read line
do
    i=$(($i+1))
    sudo tcpdump -w /home/lat/Desktop/pcap/$i.pcap &
    exec /home/lat/tor-browser_en-US/Browser/start-tor-browser $line &
    sleep 60
    ps -ef|grep TorBrowser|grep -v grep|cut -c 10-14|xargs kill -s 15
    ps -ef|grep tcpdump|grep -v grep|cut -c 10-14|xargs sudo kill -s 2
    sleep 15
done
