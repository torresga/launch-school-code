# Letter Counter (Part 1)
# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# Input: A string of one or more space separated words. Punctuation is considered part of the word.
# Output: A hash - key is word length and value is how many words of that length
# Mental model: Given a string of words, return a hash consisting of the word length and how many words have that length.

# Examples

# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# Data structure

# Input is string
# Output is hash
# We can internally split input into array, and loop over array to add keys to hash.

# Algorithm
# Create new hash
# If string is empty, return empty hash

# Split input string into an array
# Loop over array
#   If key exists
#     Add plus one to value
#   Else
#     Add key of word.length to hash
#     Add value of 1 to hash

# Code
def word_sizes(str)
  sizes = {}

  return sizes if str == ""

  str.split(" ").each do |word|
    key = word.length
    if sizes.has_key?(key)
      sizes[key] += 1
    else
      sizes[key] = 1
    end
  end
  sizes
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Further Exploration
# Take some time to read about Hash::new to learn about the different ways to initialize a hash with default values.
