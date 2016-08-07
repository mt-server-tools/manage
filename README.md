# Minetest Server Manager

Tools for managing a minetest server on Ubuntu

## What is minetest

[Minetest](http://www.minetest.net) is an open-source competitor to Minecraft. What it lacks in spit-polish, it makes up in ease of modding and extensibility.

Minetest modding is done in lightweight Lua scripting, as opposed to heavy Java programming. Minetest mods are often distributed as git repositories or ZIP files - as such, syncing a git repository to your mods directory, or unpacking a ZIP into your mods directory is often all that is needed to install a mod.

## Goals of project

Make it easy to set up a new minetest server on a Ubuntu instance, and to find and add mods to the server.

Make a place where it is easy to share mod sets, or lookup mods by name and description.

Make it easy to manage the minetest server throught its lifetime.

## Features

* [Quickly get a minetest server](install_guide/README.md) set up
	* [Extensively annotated guide](install_guide/extended_guide.md) on configuring a Ubuntu server from scratch
* Install the latest minetest from official PPA, configures swap (optional), activate firewall `installminetest`
	* Coming soon: build the absolute latest minetest, from source
* Mod-sets installation script with `mt-installmods`
* Minetest configuration command to one-line edit configuration options `mt-config`
* Single-command activate/deactivate mods with `mt-world`
* Installs `mogray5`'s DEB repository for mods allowing you to install using `apt-get` directly

## Mod Sets

The `mod-sets` directory contains individual files each specifying mods to install with the `mt-installmods` tool, and what sub-mods to install if applicable

Build your own mod spec, and make a pull request to be included!

* text-based repo database files
* currently requires mod to have a Git URL (github, gitlab, bitbucket, over SSH or HTTPS, etc...)
* re-run the mt-installmods command against the same mod sets to update all mods!
	* can be set as a cron

## To Do

* Make 'mod-sets' also accept ZIP file URLs
	* Or create a git repo for mods: upload a ZIP file, it becomes a pullable git repo over HTTP ?
* Annotated guide for mod tweaking
	* change freequency of mob spawns
	* change tree felling behaviour
	* making addendum craft recipes
	* importing mod objects but not entire mods
	* etc
