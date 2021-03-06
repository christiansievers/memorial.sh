# memorial.sh Raspberry Pi disk image

If you would rather not install the script yourself, here's a fully configured disk image that works with any Raspberry Pi: [memorial_sh_v05.zip](https://christiansievers.info/files/memorial_sh_v05.zip) (540MB .zip file)

## What is this?

It's a ready-to run clone of an SD card, the "hard drive" that a Raspberry Pi boots from. I've taken all the necessary steps to properly install the memorial script, including setting it up as [a system service](how_to_make_run_as_system_service.md). 

## How do I get it running?

Clone the disk image back to a fresh SD card, following i.e. [these instructions](https://www.raspberrypi.org/documentation/installation/installing-images/README.md). Then plug the Raspberry into your local Ethernet network. If you want it to show what it's doing, connect it to a screen, but that's optional. Then connect it to power, and leave it running. That's literally it. 


### Some technical details

The disk image is based on version v6.32 (31/08/2020) of [DietPi](https://dietpi.com/), a stripped-down Linux distribution for the Raspberry. It's tested to run on all versions of the Raspberry Pi, including the 4.

Because the memorial script works using basic networking technology, I only had to install a few more required packages (`avahi-daemon` and `git`). The hostname is `memorial`, so use `ping memorial` or `ping memorial.local` to find out its IP address. 

To see what's going on under the hood, feel free to log in with these details:

User `pi` 
Password `memorial`

User `root`
Password `memorial`

Once up and running, make sure to change the password via  `sudo dietpi-config` (the usual `sudo passwd` won't work persistently on DietPi ). Do this especially if you plan to keep it running for a long time.

### Getting it to run on Wifi, too

The DietPi distribution comes with a few ways to easily set up Wifi. Log in with the above credentials, and use `sudo dietpi-config` to set up your connection.
