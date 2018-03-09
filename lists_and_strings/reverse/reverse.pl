use strict;
use warnings;

# reverse a list
# We'll use a sentence split on spaces.
my @li = split(/ /, 'Hello world, my name is Devin!');

print join(' ', reverse(@li));