#!/bin/bash
echo reset ssh ...
ssh-keygen -f "/home/aqi/.ssh/known_hosts" -R "192.168.33.99" 2> /dev/null

echo setup hosts file ...
IS_HOST_EXIST=$(cat /etc/hosts | grep -i belajarnginx)
if [ -z "$IS_HOST_EXIST" ] 
then
  ./setup_hosts.sh
fi

echo destroy old vm ...
vagrant destroy

echo start vm
vagrant up