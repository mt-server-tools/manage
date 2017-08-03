
genhash() {
	echo "${build_options[*]}" | md5sum | cut -d' ' -f1
}

needs_rebuild() {
	[[ ! -d CMakeFiles ]] && return 0

	local curhash="$(genhash)"
	local oldhash="$(cat optshash.txt)"

	[[ "$oldhash" = "$curhash" ]] || {
		echo "$curhash" > optshash.txt
		return 1
	}

	return 0
}

realbin() {
	local binname="$1"; shift

	[[ "$binname" =~ / ]] && {
		# A relative path cannot be resolved, just check existence
		[[ -e "$binname" ]] && echo "$binname" || return 1

	} || binname="$(which "$binname")"

	# `which` failed
	[[ -n "$binname" ]] || return 1

	[[ -h "$binname" ]] && {

		local pointedname="$(ls -l "$binname"|grep -oP "$binname.+"|sed "s|$binname -> ||")"
		realbin "$pointedname" ; return "$?"
	
	} || echo "$binname"
}

thwart_root() {
	for item in "$@"; do
		chmod 700 "$(realbin "$item")"
	done
}

install_build_dependencies() {
	local core_build=(gcc g++ cmake)
	local mt_core=(libirrlicht-dev libbz2-dev libpng-dev libjpeg-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-gnutls-dev libfreetype6-dev zlib1g-dev libgmp-dev libjsoncpp-dev)
	local db_libs=(libleveldb-dev libhiredis-dev libpqxx-dev) # FIXME not sure this is the correct/final list

	sudo apt-get install "${core_build[@]}" "${mt_core[@]}" "${db_libs[@]}" -y

	# This utility presumes use on a server ;
	#   If any user gains access to the compiler, they can deliberately build an attack to gain root
	#   This is a minimal shim to thwart them.
	thwart_root gcc g++
}

BUILD_OPTS=(-DBUILD_CLIENT=0 -DBUILD_SERVER=1 -DRUN_IN_PLACE=0 -DUSE_FREETYPE=1 -DENABLE_LEVELDB=1 -DENABLE_REDIS=1 -DENABLE_POSTGRESQL=1)
BUILD_CPUS="$(grep 'model name' -c /proc/cpuinfo)"

rebuild_minetest() {

	[[ -d .git ]] && git pull origin master || echo "WARNING - you are not using a git checkout of minetest"

	needs_rebuild && rm -r CMakeFiles

	cmake "${BUILD_OPTS[@]}" && make -j "$BUILD_CPUS"
}
