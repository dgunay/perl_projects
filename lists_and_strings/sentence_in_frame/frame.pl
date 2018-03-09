use strict;
use warnings;

# Puts a sentence in a frame like:
# *********
# * Hello *
# * World *
# *********

my $sentence = $ARGV[0] or die 'Provide a sentence.';

# Grab our words as tokens in a sentence
my @words = split(/ /, $sentence);

# sort the words by length and get the length of the longest one
my @words_by_length = sort {
	length($b) <=> length($a)
} @words;
my $len_longest = length(shift(@words_by_length));

# print the beginning of the frame (* for longest word length + 4)
my $frame_end = '*' x ($len_longest + 4);
print "$frame_end\n";

# normalize every word with whitespace up to the length of the longest word
my @normalized_words = map {
	$_ = $_ . (' ' x ($len_longest - length($_)));
} @words;

# Print all of them bookended by stars.
print '* ' . $_ . " *\n" for @normalized_words;

# end the frame
print "$frame_end\n";