#!/bin/bash
echo reset ssh ...
ssh-keygen -f "/home/aqi/.ssh/known_hosts" -R "192.168.33.99" 2> /dev/null

echo destroy old vm ...
vagrant destroy

echo start vm
vagrant up