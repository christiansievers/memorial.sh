#!/usr/bin/env python
# -*- coding: utf-8 -*-

#using ElementTree to create an xml .service file
#script takes external argument

import xml.etree.cElementTree as ET
import sys

xmlTemplate = """<service-group>
        <name>%(name)s</name>
        <service>
           <type>_afpovertcp._tcp</type>
           <port>548</port>
        </service>
</service-group>"""

if __name__ in '__main__':
 data = {'name':(sys.argv[1])}

print xmlTemplate%data

