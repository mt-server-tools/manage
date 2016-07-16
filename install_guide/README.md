# Installing a Minetest Server

## The Quickstart Guide with `mt-manage`

First things you will need to do:

* Get hosting
	* There's some notes in [the providers file](providers.md)
	* You can also ask someone else to provide some space for you on the Minetest Forums
	* To use `mt-manage` ensure you are on Ubuntu 16.04 or later, and have SSH access and root permissions
* Get a domain name, or subdomain
	* Buy a domain name at namecheap for example
	* Or get a dynamic DNS name at DuckDNS
	* this allows your IP to change without breaking peoples' Favourites/bookmarked servers

Once you have these, and you are pointing your (sub-) domain at the server's IP, it's time to install

### Set up firewall and SSH security

	adduser myuser # use a strong, long passphrase
	gpasswd -a myuser sudo
	sed -r 's/#?PermitRootLogin.+/PermitRootLogin no/' -i /etc/ssh/sshd.config
	ufw allow OpenSSH
	ufw activate

You should now be logging in as `myuser` (or whatever user name you specified), and use `sudo su` to gain a root session.

### Install tools

	apt update && apt install git -y
	git clone https://github.com/taikedz/mt-manage
	cd mt-manage
	bin/installminetest

### Configure your server settings

	bin/mt-config -a AdminUsername -n "Server Name" -d "Server description. Make it catchy!" -h "server.host.name"
	bin/mt-config --pvp true --damage true
	ufw allow 30000
	systemctl restart minetest

You now have a minetest server you can connect to and play on - but don't do that yet!

### Choose mods, or choose a mod set

To use a mod-set

	bin/mt-installmods -m mod-sets/$SETNAME

To install individual mods from the mods repository

	apt-cache search minetest $MODNAME

Then use `apt-get install $PKG` to install the appropriate package

#### Activate mods

Activate the mods you have installed.

	systemctl restart minetest
	sed -r 's/false$/true/' -i /var/games/minetest-server/.minetest/worlds/world/world.mt
	systemctl restart minetest

### Choose a spawn point

This is optional. You can now log in to your server as your admin user and navigate around the world, build things, create a spawn hut if you want. Find the coordinates of the spawn point you want for all users and then run this command in the SSH session:

	bin/mt-config --set-spawn "$X, $Y, $Z"

Replace X, Y and Z as appropriate, remember to use the double-quotes.

Restart the service

	systemctl restart minetest

## Go Live!

You can advertise your server on the main minetest list now!

	bin/mt-config -b true
	systemctl restart minetest

If you want, create an entry in the Servers section of the forums to talk about your server!

# More information

See the [extended guide](extended_guide.md) for lenghtier notes and troubleshooting tips and tricks.

See [mogray5's forum post](https://forum.minetest.net/viewtopic.php?f=14&t=13051&p=225402) for more information on the APT repository

See the [modding API guide](http://dev.minetest.net/Main_Page) for more information about mods, and to learn how to tweak mods.
