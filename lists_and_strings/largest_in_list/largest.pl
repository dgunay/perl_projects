use strict;
use warnings;
use List::Util qw[max];

# open file handle
open(my $fp_in, '<', $ARGV[0]) or die 'No input filename specified.';

# consume the file as array of trimmed lines
chomp(my @nums = <$fp_in>);

# return the largest value using the max function
print max @nums;

# A more efficient way would be to keep track of the largest value while 
# reading, but this is an attempt at using Perl's high level facilities.