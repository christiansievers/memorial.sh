#!/bin/bash

# memorial.sh
# v0.1
# by Christian Sievers 2017 http://christiansievers.info

# A memorial to commemorate those that died trying to make it into Fortress Europe
# Source: UNITED for Intercultural Action - www.unitedagainstracism.org
# -----------------------------------------------------------------------------------

# make it executable with chmod +x memorial.sh

# needs to run with root privileges
if [ "$EUID" -ne 0 ]
  then echo "Please run as root: sudo ./memorial.sh"
  exit
fi

#create initial service files
python create_service_file.py "source: UNITED for Intercultural Action" > 1.service
python create_service_file.py unitedagainstracism.org > unitedagainstracism_org.service

cp *service /etc/avahi/services/
sleep 5

# loop
while IFS='' read -r line || [[ -n "$line" ]]; do
    sed -i "2s/.*/<name>$line<\/name>/" /etc/avahi/services/1.service 
    service avahi-daemon restart
    echo $line
    sleep 60
done <List_of_33305_documented_deaths_63char.txt
