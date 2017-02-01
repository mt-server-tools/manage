# Minetest Server Manager

Tools for managing a Minetest server on Ubuntu

Released under the GNU General Public License -- you may run, modify and redistribute this software so long as the copyright notice, and the LICENSE file, stay intact, and you provide the source code of the version you have distributed to any party who requests it, free of charge.

*NOTE: this tool chain is going to have a massive overhaul in favour of building a Minetest server from source, with the goal of supporting Debian family, Fedora family, and Arch. The mods installation tools will be re-written in python to support Mac and Windows, without git. A server component to convert git repositories into ZIP files will also be added.*

## What is Minetest

[Minetest](http://www.minetest.net) is an open-source competitor to Minecraft. What it lacks in spit-polish, it makes up in ease of modding and extensibility.

Minetest invites you to be creative whilst playing the game. Minetest allows you to be creative in how the game itself works.

Minetest is ready to be modded - as opposed to requiring special add-ons and hacks to make it moddable.

Minetest modding is done in lightweight Lua scripting, as opposed to heavy Java programming. Minetest mods are often distributed as git repositories or ZIP files - as such, syncing a git repository to your mods directory, or unpacking a ZIP into your mods directory is often all that is needed to install a mod.

## Goals of project

Make it easy to set up a new Minetest server on a Ubuntu instance, and to add appropriate entry level mods to the server, as themed sets.

Make a place where it is easy to share mod sets, or lookup mods by name and description.

Make it easy to manage the Minetest server throughout its lifetime.

Make it easy to run multiple non-root Minetest instances

## Features

* [Quickly get a Minetest server](install_guide/README.md) set up
	* [Extensively annotated guide](install_guide/extended_guide.md) on configuring a Ubuntu server from scratch
* Install the latest Minetest from official PPA, configures swap (optional), activate firewall `installminetest`
	* Alternatively, build the absolute latest Minetest, from source
* Mod-sets installation script with `mt-installmods`
* Minetest configuration command to one-line edit configuration options `mt-config`
* Single-command activate/deactivate mods with `mt-world`
* Build the C++ Minetest Mapper (Rogier-5 fork) from source

## Mod Sets

The `mod-sets` directory contains individual files each specifying mods to install with the `mt-installmods` tool, and what sub-mods to install if applicable

Build your own mod spec, and make a pull request to be included!

* text-based repo database files
* currently requires mod to have a Git URL (github, gitlab, bitbucket, over SSH or HTTPS, etc...)
* re-run the mt-installmods command against the same mod sets to update all mods!
	* can be set as a cron

## To Do

* Re-write in favour of multiple-instances built from source
	* instance management
		* `world.mt` editing (single-command activation/deactivation of mods using patterns)
		* `minetest.conf` tuning with network profiles
	* Linux user assignment
	* Support CentOS and Arch
	* systemd and initv support per-instance
	* instance archival, removal, and restore
	* port assigment management
* vsFTPd
	* installation and setup
	* access to instance directories with granular control (mods, textures, games, world, conf, logs)
* Annotated guide for mod tweaking
	* change frequency of mob spawns for `mobs_redo` mobs
	* making addendum craft recipes
	* Using `entity_override` to adjust mobs, and create variant mobs
	* Using `entity_override` to add functionality
