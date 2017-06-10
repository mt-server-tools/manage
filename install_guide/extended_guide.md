# Installing a Minetest Server

These are brief guided notes on installing a minetest server for Ubuntu 16.04

At the time of writing, the version of Minetest server is 0.4.14

These notes assume you have been able to install Ubuntu server 16.04 or obtain a VPS with it preinstalled, and know how to access the command line of the target server.

## Installing the PPA and `minetest-server`

As root, edit `/etc/apt/sources.list.d/minetestppa.list` and add these lines:

	deb http://ppa.launchpad.net/minetestdevs/stable/ubuntu xenial main
	deb-src http://ppa.launchpad.net/minetestdevs/stable/ubuntu xenial main

Then run

	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0CD0F565F8CDAB41
	apt update
	apt install minetest-server minetest-data minetest-mod-mobf --assume-yes

This will install the base required items.

## Adding mods

Use the `mt-installmods` tool to install mods from individual mod-sets.

### Mod sets files

Mod Sets files allow you to list URLs to download mods, and optionally what subdirectories contain the mods you want to install to your server mods directory.

The initial line must contain the string `MTMODLIST` in it to identify a mod list file.

Each line specifies a URL to a Git repository (Github, Gitlab, HTTP server, etc) where the mod can be downloaded from. It can optionally be followed by the names of sub-directories if the repo itself is not the mod.

	# Example: the travelnet mod
	# The github repo itself is the mod folder, so we don't specify any mods after the URL
	https://github.com/Sokomine/travelnet
	
	# Example: the 3d-armor mod
	# The github repo actually houses multiple mods without specifying a modpack
	# We specify in a space-separated list which ones we want to use
	# these are the names of the mod directories directly under the github repo
	https://github.com/stujones11/minetest-3d_armor 3d_armor 3d_armor_stand shields

Run the script, supplying one or more mod set files

	mt-installmods MODSETFILE ...

## Editing the server settings

You need to configure the server at this point. Point your editor at `/etc/minetest/minetest.conf`, or use the `mt-config` tool. See the tool help for more information.

	mt-config --help

There are a number of settings you can change here. Most are self-explanatory, and I encourage you to read them all to eek the best experience out of the server, though I should single out some:

* `name`
	* The player-name of the admin - this player will always have all privileges.

* `port`
	* note the default port for `minetest-server` is 30000 (thirty thousand)
	* you will want to adjust your inbound firewall rules appropriately
	* see [Very Easy Firewall](https://github.com/taikedz/vefirewall) if you're totally new to firewalling
* `default_privs`
	* the default privileges assigned to any new user
	* check the [Minetest wiki](http://wiki.minetest.net/Privileges) for details on privileges and see what else you may want to grant average users
* `server_announce`
	* don't activate this until you are ready to host publicly
* `motd`
	* this text is shown in the chat upon login. You can customize it to show latest news etc if you want, or provide a URL for newbies, etc.
* `strict_protocol_version_checking`
	* Set this to true if you run a public server - you don't want to allow deprecated protocols to be used as they can be abuse by attackers and cheaters in general.
* `give_initial_stuff`
	* set to true to activate the "initial stuff" script (see later)
* `disallow_empty_password`
	* You are going to be administering a system. Reduce the risk of players sending you messages about their accounts being hijacked because they didn't use a password.
* `ignore_world_load_errors`
	* Set to true to avoid unexpected downtime when an error occurs
* `debug_log_level`
	* set to 1 or 2, depending on how much detail you want in your logs.
	* You probably want to set up log rotation

A lot of the later settings relate to bandwidth performance; you'll have to study and tailor that to your own needs.

### Initial stuff

A player who newly logs on to the server can be given a set of starting equipment. This is defined in `/usr/share/games/minetest/games/minetest_game/mods/give_initial_stuff/`

Here's the default list, replicate a line and replace the final text with the item string you desire. See the minetest wiki for common items descriptions and itemstrings (under their image).

	player:get_inventory():add_item('main', 'default:pick_steel')
	player:get_inventory():add_item('main', 'default:torch 99')
	player:get_inventory():add_item('main', 'default:axe_steel')
	player:get_inventory():add_item('main', 'default:shovel_steel')
	player:get_inventory():add_item('main', 'default:cobble 99')

You can modify the initial gives to suit your taste.

### World edit

Ensure first that the world you specified is being used and that the existing mods are available for toggling by restarting the server:

	systemctl restart minetest-server
	systemctl status minetest-server

Press `q` to exit the report after viewing the status.

Now go to the world directory you defined in the config - by default this is `/var/games/minetest-server/.minetest/worlds/world/`

Edit the `world.mt` file (it will be called this, whatever the name of the world)

You will see a list of all the custom mods available, and they will all at this point be "false". Change these all to true -- in `vim` you can issue this command:

	:%s/false$/true/

and `:wq` to write and exit

In `nano` you can use the `^\` command (`^` stands for the Ctrl key).

* At the first prompt type `false`
* then at the next type `true`
* and finally press `a` to apply on all lines.
* `^o` and `y` to save, `^x` to quit

Finally, restart the `minetest-server` service again

	systemctl restart minetest-server

## Play!

You can now play on your minetest server! You will need the server IP (run `ifconfig` to find this)

Run minetest and choose the "client" tab; in the address field type the IP address or FQDN if you are able to configure DNS.

Choose a name (suggestion: now's the time to use that admin name from when you configured the server), and a password, and connect!

Voila - you are now ready to host a public `minetest` server! You can now switch on the `server_announce` config and let the world know of your game!

Happy mining!

# Troubleshooting

Remember: after you modify any file, install any mod, change any setting, you need to `systemctl restart minetest-server`

The following notes are useful if you are new to managing a Linux host.

## Useful tools

If you have never set up a server of any kind, here are some tips that make it easier:

* If you have never connected to a Linux server before, you can cehck [DigitalOcean's guide](https://www.digitalocean.com/community/tutorials/how-to-connect-to-your-droplet-with-ssh)
	* For hosting, you need more than just regular hosting - you need a VPS, or to perform port forwarding on your home router to a machine inside your home
* use `htop` to profile your server performance in colour
* learn to use `vim` or `emacs`. 
	* but `nano` command will do if you do not have the confidence to approach the `vim` learning curve. I am told Emacs is equally as daunting to the novice.
* use tmux - it's a temrinal multiplexer, which means you can ssh once into a server, and then have multiple views open at a time
	* the other advantage is that it keeps running if your connection suddenly drops
	* this means when you re-establish connection, you can run `tmux a` to re-attach to the session you were in previously
	* the corollary to this is that it won't break sensitive install/upgrade operations!

## Commands

A few useful commands and tidbits to use when troubleshooting:

You can verify where the server is logging to by running

	ps aux | grep minetest-server | grep log=

Check the log file to see if there are any issues there

If the server didn't seem to start at all, try `journalctl -xe -u minetest-server` and `systemctl status minetest-server`

If your mods aren't loading, check that you activated them in `world.mt`; then check the logs with grep

	grep $MODNAME $LOGPATH -B 2 -A 5

Substitute `$MODNAME` and `$LOGPATH` accordingly.

If your client cannot connect (timed out), check to see that your firewall is accepting incoming connections on the desired port. `sudo ufw status`.

Check also that the service is not in a restart loop:

	less +F /var/log/minetest/minetest.log

Watch this for a few seconds. If it remains the same always, then try connecting and see if it registers any activity at all. If it periodically scrolls lots of data, of which the minetest ASCII logo, it is in a loop; hit `Ctrl C` and use Pg Up/Pg Dn (w / z also work) to locate the "Separator" that indicates the start of a new logging session and work down from there until you find your error.

### System updates

You need to keep the libraries in your system up-to-date to avoid being hacked.

Generally on Ubuntu, and given the software we are managing here, this should be sufficient:

	apt update && apt upgrade

Do this once every week or so.

If you do a full system/distro upgrade, you may need to re-run the minetest install script to re-enable an appropriate PPA version.

## Linux in general

`minetest-server` as distributed via the PPAs tends to do things by the book, so everything is where you should expect it.

* Application configurations in Linux are typically stored in `/etc/$APPNAME`, remember this in general.
	* In the case of minetest, this is the overall server config.

* Application core assets (executables, themes, core data) tend to be stored in `/usr`, remember this in geenral.
	* In the case of minetest, custom mods and additional games and textures are installed in `/usr/share/games/minetest`.

* Application user data that tends to change whilst the application is used is typically stored under `/var`, remember this in general.
	* In the case of minetest, this is world-related data at `/var/games/minetest-server/.minetest`

* Application logs tend to be predictably stored in `/var/logs`, and only accessible by root.
	* Minetest's logs are at `/var/log/minetest` though you can also view them with the `journalctl -xe -u minetest` command

### Performance

You can monitor the performance of the server with the `top` command

A more friendly command however is `htop`. Simply install and run

	apt install htop
	htop

You can see at a glance how much memory and CPU usage is occurring, the server load (read up on load averages), memory usage and swap usage (if you have swap at all - in the case of a single-use server it is debateable whether this is necessary; when you have multiple applications being served, you may see some benefit. The jury is out on the use of swap. Tailor to your needs)

## Reporting

You may want to set up a cron job that monitors the log for any errors. First install the GNU mail utilities

	apt install mailutils

Accept the defaults

Send yourself a test email:

	echo Hello | mailx -s "This is a test" -r minetest@yourname.nul you@host.net


Check your spam folder. You may want to set up a filter to always accept mail from "minetest@yourname.nul"

Then create a script (let's assume you save it in `/root/minetest-alert.sh`):

	#!/bin/bash
	MTMSG="$(grep ERROR /var/log/minetest/minetest.log -B 2 -A 5)"
	if [[ -n "$MTMSG" ]]; then
		echo "$MTMSG" | mailx -s "Error on minetest server $HOSTNAME"  -r minetest@yourname.nul you@host.net
	fi

Then set up a cron job to alert you about errors: run `crontab -e`

and add this line

	*/5 * * * * bash /root/minetest-alert.sh

This will check every 5 minutes, and alert you if any errors are found. Be careful with this level of frequency, you may find yourself awash with alerts if you can't get to your server as soon as possible...!

A more professional solution is Nagios, Icinga, or the likes.

Any problems with the scripts, [raise an issue](https://github.com/taikedz/mt-manage/issues)

Any questions, ping me on twitter [@taikedz](https://twitter.com/taikedz)

Any grievances, find me in-game as `DuCake` and we can have a deathmatch.
