# OS environment

These scripts should run on AWS EC2 instance which connected to AWS S3 Service. In addition, a GUI environment is needed to run Tor Browser.

# Software dependency

1. tcpdump

1. torbrowser

1. tshark

1. aws-cli

# data_transformation.py

This is the Python code to transform captured data to +1/-1 format, there are two parameters needed which are the source address of the computer used to capture data and the path of txt file
