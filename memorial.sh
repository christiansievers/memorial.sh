#!/bin/bash

# memorial.sh
# v0.1
# by Christian Sievers 2017-2019 http://christiansievers.info

# A memorial to commemorate those that died trying to make it into Fortress Europe
# Source: UNITED for Intercultural Action - http://unitedagainstrefugeedeaths.eu. 
# Contact: listofdeaths@unitedagainstracism.org
# -----------------------------------------------------------------------------------

# make it executable with chmod +x memorial.sh


# needs to run with root privileges
if [ "$EUID" -ne 0 ]
  then echo "Please run as root: sudo ./memorial.sh"
  exit
fi

# create initial service file
echo '<?xml version="1.0" standalone='\'no\''?>
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
    <name>www.unitedagainstrefugeedeaths.eu</name>
    <service>
        <type>_afpovertcp._tcp</type>
        <port>548</port>
    </service>
</service-group>' > /etc/avahi/services/unitedagainstracism_org.service


count=0

	# loop
while true; do
	while IFS='' read -r line || [[ -n "$line" ]]; do #read lines

		count=$[$count+1]
		echo $count
	
		echo '<?xml version="1.0" standalone='\'no\''?>
		<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
		<service-group>
		<name>'"$line"'</name>
		<service>
			<type>_afpovertcp._tcp</type>
			<port>548</port>
		</service>
	</service-group>' > /etc/avahi/services/1.service

		echo $line
		date +"%T %D"
		
			   while [ $count = 10 ]; do # 3rd level nested loop runs every 10 times
			   service avahi-daemon restart
			   echo "   restarted avahi ####"
			   count=0
			   done

		sleep 30
	done <List_of_documented_deaths_63bytes.txt 
done
