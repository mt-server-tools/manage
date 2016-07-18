# Minetest Server Manager

Tools for managing a minetest server on Ubuntu

Version: 0.1

## What is minetest

[Minetest](https://minetest.net) is an open-source competitor to Minecraft. What it lacks in spit-polish, it makes up in ease of modding and extensibility.

Minetest modding is done in lightweight Lua scripting, as opposed to heavy Java programming. Minetest mods are often distributed as git repositories or ZIP files - as such, syncing a git repository to your mods directory, or unpacking a ZIP into your mods directory is often all that is needed to install a mod.

## Goals of project

Make it easy to set up a new minetest server on a Ubuntu instance, and to find and add mods to the server.

Make a place where it is easy to share mod sets, or lookup mods by name and description.

Make it easy to manage the minetest server throught its lifetime.

## Features

* Install the latest minetest, configures swap (optional), activate firewall
* Mod-sets installation script
* Minetest configuration command to one-line edit configuration options
* Extensively annotated guide on configuring a Ubuntu server from scratch
* Installs `mogray5`'s DEB repository for mods allowing you to install using `apt-get` directly

## Mod Sets

The `mod-sets` directory contains individual files each specifying mods to install with the `mt-installmods` tool, and what sub-mods to install if applicable

Build your own mod spec, and make a pull request to be included!

* text-based repo database files
* currently requires mod to have a Git URL (github, gitlab, bitbucket, over SSH or HTTPS, etc...)

## To Do

* manage `world.mt` file
* Make 'mod-sets' also accept ZIP file URLs
* Annotated guide for mod tweaking
	* change freequency of mob spawns
	* change tree felling behaviour
	* making addendum craft recipes
	* importing mod objects but not entire mods
	* etc
