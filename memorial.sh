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

# create initial service file
echo '<service-group>
    <name>unitedagainstracism.org</name>
    <service>
        <type>_afpovertcp._tcp</type>
        <port>548</port>
    </service>
</service-group>' > /etc/avahi/services/unitedagainstracism_org.service


count=0

# loop
while IFS='' read -r line || [[ -n "$line" ]]; do

    count=$[$count+1]
    echo $count
    
    # create service file
    echo '<service-group>
    <name>'"$line"'</name>
    <service>
        <type>_afpovertcp._tcp</type>
        <port>548</port>
    </service>
</service-group>' > /etc/avahi/services/1.service

    echo $line
    date +"%T %D"
    
       while [ $count = 5 ]; do # nested loop that runs every 5 times
          service avahi-daemon restart
          echo "   restarted avahi ####"
          count=0
       done
       
    sleep 60
done <List_of_33305_documented_deaths_63char.txt
