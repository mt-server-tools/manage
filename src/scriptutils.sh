

function mustberoot {
	if [[ "$UID" != 0 ]]; then
		faile "You must be root"
	fi
}

function getarg {
	# getarg ... SWITCH ARG ...
	local SWITCH="$1" ; shift

	while [[ -n "$*" ]]; do
		local ARG="$1" ; shift
		case "$ARG" in
			$SWITCH)
				echo "${1:-}"
				return 0
				;;
		esac
	done
	return 1
}
