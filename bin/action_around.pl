#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

# Radius, in nodes
my $radius = 5;

# Central coords
#-169,2,122
my $x0 = 0;
my $y0 = 0;
my $z0 = 0;

# detect place, dig, take, punch, punched by

# grep -P 'at \(.+?\)'|sed -r 's/^.+ACTION\[ServerThread\]: //'

sub inrange {
	my $px = $_[0];
	my $py = $_[1];
	my $pz = $_[2];
	# (x - x0)² + (y - y0)² + (z - z0)² <= r²
	# printf("Processing range for %s,%s,%s\n",$px,$py,$pz);
	
	return ($px - $x0)**2 + ($py - $y0)**2 + ($pz - $z0)**2 <= $radius ** 2;
}

while (<>) {
	# print "Processing $_";
	if ($_ =~ m/at \(([0-9.,-]+),([0-9.,-]+),([0-9.,-]+)\)/ ) {
		my $px = int(floor($1));
		my $py = int(floor($2));
		my $pz = int(floor($3));
		
		if ( inrange($px,$py,$pz) ) {
			print $_;
		}
	}
}
