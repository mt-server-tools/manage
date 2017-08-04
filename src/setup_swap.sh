

get_swap_size() {
	while true; do
		local swapsize="$(uask "You have no swap - please specify the # of MB of swap to configure, or leave emtpy to configure no swap (eg. 1000 for a gigabyte)")"

		[[ "$swapsize" =~ ^[0-9]+$ ]] && {
			echo "$swapsize"
			return
		}

		warne "Invalid swap size. Enter 0 for no swap"
	done
}

has_swap() {
	[[ "$(free|grep -i swap|awk '{print $2}')" -lt 1 ]]
}

setup_swap() {
	has_no_swap || return

	local swapsize="$(get_swap_size)"

	[[ "$swapsize" -gt 0 ]] || return
	(
		mkdir /swaps
		cd /swaps
		dd if=/dev/zero of="./swap1" bs="$(( 1024 * 1024 ))" count="$swapsize" || return

		chown root:root "./swap1"
		chmod 600 "./swap1"
		mkswap "./swap1"

		export $(blkid swap1|grep -o -P 'UUID\S+')
		echo "UUID=$UUID none swap defaults 0 0" >> /etc/fstab

		swapon -a

		has_no_swap && warne "Swap setup failed. Check fstab entry."
	)
}
