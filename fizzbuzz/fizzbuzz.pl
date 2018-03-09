use strict;
use warnings;

for my $i (0 .. 100) {
	my $fizz = $i % 3 == 0;
	my $buzz = $i % 5 == 0;

	print 'Fizz' if $fizz;
	print 'Buzz' if $buzz;
	print "$i" unless $fizz or $buzz;

	print "\n";
}