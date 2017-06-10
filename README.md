# Minetest Server Manager

Tools for managing a Minetest server on Ubuntu

Released under the GNU General Public License -- you may run, modify and redistribute this software so long as the copyright notice, and the LICENSE file, stay intact, and you provide the source code of the version you have distributed to any party who requests it, free of charge.

*NOTE: this tool chain is going to have a massive overhaul in favour of building a Minetest server from source, with the goal of supporting Debian family, Fedora family, and Arch. The mods installation tools will be re-written in python to support Mac and Windows, without git. A server component to convert git repositories into ZIP files will also be added.*

## What is Minetest

[Minetest](http://www.minetest.net) is an open-source competitor to Minecraft. What it lacks in spit-polish, it makes up in ease of modding and extensibility.

Minetest invites you to be creative whilst playing the game. Minetest allows you to be creative in how the game itself works.

Minetest is ready to be modded - as opposed to requiring special add-ons and hacks to make it moddable.

Minetest modding is done in lightweight Lua scripting, as opposed to heavy Java programming. Minetest mods are often distributed as git repositories or ZIP files - as such, syncing a git repository to your mods directory, or unpacking a ZIP into your mods directory is often all that is needed to install a mod.

Nearly all activity is run on the server - so all mod code is run on the server. Clients do not need to install extra mods for a full online experience.

## Goals of this project

Make it easy to set up a new Minetest server on a Ubuntu instance.

Make a system wherein it is easy to share mod sets, or lookup mods by name and description.

Make it easy to manage the Minetest server throughout its lifetime.

Make it easy to run multiple non-root Minetest instances

## Status

In re-work
