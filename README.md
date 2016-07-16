# Minetest Server Manager

Tools for managing a minetest server on Ubuntu

Version: 0.0.2 - keep digging

## What is minetest

[Minetest](https://minetest.org) is an open-source competitor to Minecraft. What it lacks in polish it makes up in ease of modding and extensibility.

Minetest modding is done in lightweight Lua scripting, as opposed to heaview Java programming. Minetest mods are often distributed as git repositories - as such, syncing a git repository to your mods directory is often the single step to installing a mod.

## Goals of project

Make it easy to set up a new minetest server on a Ubuntu instance, and to find and add mods to the server.

Make a place where it is easy to share mod sets, or lookup mods by name and description - either by way of a git-manged file, or an actual server-client model repo system

Currently there are only two items of note: a single script that installs the latest minetest on your Ubuintu server system, and a script for installing collections of mods

## Features

* Install the latest minetest
* text-based repo database files
	* fork this repo, add your own mod list file, and make a pull request to be included!

I have also included an extensively annotated guide on configuring a Ubuntu server from scratch, in place until (and after) this project is complete.

## To Do

* manage `world.mt` file
* basic `minetest.conf` initial params setter (install prompt?)
* a proper searchable database of mods with descriptions, URL to description, and URL to source/ZIP (not necessarily github)
* firewall management assistant/notes
* tools to change freequency of spwans etc
* tools to change some behaviours (eg tree felling, etc)

## X-Worlds

A side project to allow sharing basic user data between servers, essentially allowing a carryable inventory.

## Forum

[Discussion thread](https://forum.minetest.net/viewtopic.php?f=3&t=15145)
