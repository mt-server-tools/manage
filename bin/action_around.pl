#!/usr/bin/perl

# Radius, in nodes
my radius = 30;

# Central coords
my x0,y0,z0 = 0,0,0;

# detect place, dig, take, punch, punched by

# grep -P 'at \(.+?\)'|sed -r 's/^.+ACTION\[ServerThread\]: //'

sub inrange(px,py,pz) {
	# (x - x0)² + (y - y0)² + (z - z0)² <= r²
	
	return (px - x0)**2 + (py - y0)**2 + (pz - z0)**2 <= radius ** 2;
}

while (<>) {
	$_ =~ /at \(([0-9.,-]),([0-9.,-]),([0-9.,-])\)/
	my px = int(floor($1));
	my py = int(floor($2));
	my pz = int(floor($3));
	
	if inrange(px,py,pz) {
		print $_;
	}
}
