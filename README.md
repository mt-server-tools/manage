# Minetest Server Manager

Tools for managing a minetest server on Ubuntu

Version: 0.1

## What is minetest

[Minetest](https://minetest.org) is an open-source competitor to Minecraft. What it lacks in polish it makes up in ease of modding and extensibility.

Minetest modding is done in lightweight Lua scripting, as opposed to heaview Java programming. Minetest mods are often distributed as git repositories - as such, syncing a git repository to your mods directory is often the single step to installing a mod.

## Goals of project

Make it easy to set up a new minetest server on a Ubuntu instance, and to find and add mods to the server.

Make a place where it is easy to share mod sets, or lookup mods by name and description - either by way of a git-manged file, or an actual server-client model repo system

Currently there are only two items of note: a single script that installs the latest minetest on your Ubuintu server system, and a script for installing collections of mods

## Features

* Install the latest minetest, configures swap (optional)
* Mod-sets installation script
* Minetest configuration command to one-line edit configuration options
* Extensively annotated guide on configuring a Ubuntu server from scratch
* Integrates `mogray5`'s DEB repository for mods allowing you to install using `apt-get` directly

## Mod Sets

The `mod-sets` directory contains individual files each specifying mods to install with the `mt-installmods` tool, and what sub-mods to install if applicable

Build your own mod spec, and make a pull request to be included!

* text-based repo database files
* currently requires mod to have a Git URL - soon to be updated to also accept ZIP files

## To Do

* manage `world.mt` file
* Annotated guide for mod tweaking
	* change freequency of mob spawns
	* change tree felling behaviour
	* making addendum craft recipes
	* importing mod objects but not entire mods
	* etc
