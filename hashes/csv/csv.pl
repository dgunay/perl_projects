use strict;
use warnings;
use Text::CSV_XS;
use Data::Dumper;

# Parses CSV into arrays for us
my $csv = Text::CSV_XS->new();

open(my $in, '<', $ARGV[0]) or die 'File please.';

# Returns a reference to an array of CSV cols
my @header = @{$csv->getline($in)};

# We want an array of references to hashes (each hash being a
# CSV row with column_name => column_value relationship)
my @rows = ();
while (my $line = <$in>) {
	if ($csv->parse($line)) {
		# Initialize our reference to a hash using the header as keys
		my $row_ref = {map { $_ => '' } @header};

		# Use the CSV header to map each key/value pair in our hash
		my @fields = $csv->fields();
		for my $i (0 .. scalar(@fields) - 1) {
			$row_ref->{$header[$i]} = $fields[$i];
		}

		push @rows, $row_ref;
	}
}

# We have a nice pretty representation of our CSV that dumps nicely
print Dumper @rows;