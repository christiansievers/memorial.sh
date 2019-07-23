# memorial.sh
A network performance as live memorial to those who have died trying to make it into Europe.

The "network neighborhood", a functionality built in to all common desktop operating systems, shows you available local network resources. Often the computers are named after whoever uses them, so you can see who else is at work, even if it's physically remote from you, down the corridor or on another office floor.

The machines on the network become a kind of placeholder for the people that use them. They're present, and at the same time they're not. It's this 'place', both intimate and abstract, that the memorial populates with the people that have died trying to make it into Europe. As a small intervention and symbolic gesture, the memorial invites those that are not around anymore into these very specific "neighborhoods".

Even though it's not the only such trail in the world, the route into Europe is the most deadly. Because of the nature of the physical terrain, the exact number of incidents will remain forever unknown. The memorial is using the list of refugee deaths composed by the Dutch NGO UNITED for Intercultural Action, which seems to be the most reliable database. As of April 2019 it consists of 4333 documented incidents and 36.570 deaths. You can find out more about the list here: http://unitedagainstrefugeedeaths.eu. Contact: listofdeaths@unitedagainstracism.org.

## Implementation

Anyone can install and run the memorial. As a rule, the list of incidents should not be tampered with. Once started, the memorial should be allowed to display the list at least once in its entirety.

In an exhibition context the memorial should occupy the host institution's local network(s), and its presence should be made known to visitors.

## How it works

A simple shell script parses through the list of deaths and advertises each line as a hostname, using Avahi/Zeroconf (Bonjour on Mac OS). Every minute a new name is set. At this rate it'll take 72 hours to show the entire list of incidents. Due to technical limitations, only the first 63 characters of each line are shown.

## Installation requirements

Raspberry Pi board or any Linux machine, connected to local Ethernet and Wifi networks. Download the shell script and the list of incidents, and run it with i.e. `sudo bash memorial.sh &`

## Screenshots
![extract of 24 random incidents](memorial_sh_animation.gif)  
an animation showing 24 random incidents, sped up 12x

![screenshot ubuntu](memorial_ubuntu.png)
hosts as they appear i.e. in Ubuntu 

![screenshot tcpdump](tcpdump.png)
example network traffic, capture of two minutes
