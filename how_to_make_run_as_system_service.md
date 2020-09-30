# Make the script run as a system service

Once you know [how to run it](Readme.md), it's a good idea to make sure that the script runs continuously, and restarts automatically after a power failure. To do that, we'll use `systemd` to run it as a system service. First, we're going to define the service that calls the memorial.sh script. The service definition must be in the `/lib/systemd/system` folder:

```
cd /lib/systemd/system/
sudo nano memorial.service
```

Our service is going to be called `memorial.service` (yes, I know) 
(copy and paste into the nano editor):
```
[Unit]
Description=making sure memorial.sh is constantly running
After=multi-user.target

[Service]
Type=simple
ExecStart=/bin/bash /home/pi/memorial.sh/memorial.sh
Restart=always

[Install]
WantedBy=multi-user.target
```

Quit nano by pressing ctrl-X on your keyboard, confirm with Y and hit return.  
  
Now that we have the service defined we need to activate it. First we make sure the permissions are right, then load the service: 
```
sudo chmod 644 /lib/systemd/system/memorial.service
chmod +x /home/pi/memorial.sh/memorial.sh
sudo systemctl daemon-reload
sudo systemctl enable memorial.service
sudo systemctl start memorial.service
```

To check the status of the new service, run
```
sudo systemctl status memorial.service
``` 

Reboot with `sudo reboot` and run the last line again, to check that it's working as expected. You can also watch the script iterate through the line of incidents in real time with `sudo journalctl -f -u memorial.service`
