# Madlibs Revisited
# Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.
#
# Make a madlibs program that reads in some text from a text file that you have created,
# and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it.
# You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source.
# Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.
#
# Input: A text file that has a sentence.
# Output: the new sentence with random nouns, verbs, adjectives, and adverbs inside of it.

# Example output:
#
# The {adjective} brown {noun} indubitably
# {verb} the sleepy {adjective}
# {noun}, who {adverb} licks his
# {noun} and {verb} around.

# Create a list of nouns
# Create a list of verbs
# Create a list of adverbs
# Create a list of adjectives
#
# Loop over line in text file
#   replace {adjective} with random adjective
#   replace {noun} with random noun
#   replace {verb} with random verb
#   replace {adverb} with random adverb
#   Return string

NOUNS = %w(dog cat pig kitten gopher)
VERBS = %w(sat looks saw meowed)
ADVERBS = %w(sloppily hungrily angrily softly)
ADJECTIVES = %w(yellow orange green gold)

File.open("madlibs.txt").each do |line|
  sub_line = line
  sub_line.gsub!("{adjective}", ADJECTIVES.sample)
  sub_line.gsub!("{noun}", NOUNS.sample)
  sub_line.gsub!("{adverb}", ADVERBS.sample)
  sub_line.gsub!("{adjective}", ADJECTIVES.sample)
  sub_line.gsub!("{verb}", VERBS.sample)
  puts sub_line
end
