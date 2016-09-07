# Mod Sets format

## Version 1.0

This version of the modsets file specifies simple git urls, along with subdirectories to move to mods dir.

This needs to be deprecated

## Version 2.0

Version 2 needs to support

* git URL
* tar.gz files
* zip files

Proposed format:

* A type declaration
* An update declaration - if an update script is run against the modset file, determines whether to attempt to re-download and update the mod
* URL - where to download from
* subdir - in case the syncd/unpacked directory is not itself the mod, specify here the path to the mod/modpack

	#type update url [subdir]
	zip false http://forum.minetest.net/file.php?id=aursybj
	tgz true http://modders-site.net/filedownload
	git true http://gitlab.what/repo.git modpath
	zip true file:///home/minetest/modpkgs/mod.zip

* git updates in particular use the update flag to determine whether to stash before an update (which should be from origin, on same branch) and then pop stash; or to not attempt to update at all (bail on non-committed changes)
* For file:/// schemas, a local md5 should be kept of the file to determine whether it has changed
