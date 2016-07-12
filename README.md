# Minetest Server Manager

Tools for managing a minetest server on Ubuntu

Version: 0.0.1 - not really ready

## What is minetest

[Minetest](https://minetest.org) is an open-source competitor to Minecraft. WHat it lacks in polish it makes up in ease of modding and extensibility.

Minetest modding is done in lightweight Lua scripting, as opposed to heaview Java programming. Minetest mods are often distributed as git repositories - as such, syncing a git repository to your mods directory is often the single step to installing a mod.

## Goals of project

Make it easy to set up a new minetest server on a Ubuntu instance

Currently there are only two items of note: a single script that installs the latest minetest on your Ubuintu server system, and a script for installing collections of mods

## Features

* Install the latest minetest
* text-based repo database files
	* fork this repo, add your own mod list file, and make a pull request to be included!

## To Do

* specify where to install the mods to explicitly
* manage `world.mt` file
* basic `minetest.conf` initial params setter (install prompt?)
* a proper searchable database of mods with descriptions, URL to description, and URL to source/ZIP (not necessarily github)
* firewall management assistant/notes
* tools to change freequency of spwans etc
* tools to change some behaviours (eg tree felling, etc)
