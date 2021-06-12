#!/bin/bash
# Update OS w any paches
#su # need to be root to run the updates
#yum update -y --exclude=kernel
sudo yum update -y --exclude=kernel
#Tools
sudo yum install -y nano git unzip screen wget nc telnet