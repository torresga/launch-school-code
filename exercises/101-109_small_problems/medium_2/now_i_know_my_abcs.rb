# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

# Input: A string
# Output: A boolean
# Mental model: Given a string, return false if the string contains letters that match a key and value in the same key value pair. Else return true.

# Also make sure to upcase each character when looping over string or array.

# Examples:

# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true

# We need to know if word contains keys that are in both keys and values

# Data Structures

# blocks can be a hash of key value pairs
# Input can be of an iterative type - array

# Algorithm

# Create a hash of key value block pairs

# Loop over each uppercase character of string
#   If character is a key
#     if value of that key included in the string
#       return false

#   Else return true

# Code

BLOCKS = {
  B: "O",
  X: "K",
  D: "Q",
  C: "P",
  N: "A",
  G: "T",
  R: "E",
  F: "S",
  J: "W",
  H: "U",
  V: "I",
  L: "Y",
  Z: "M"
  }

def block_word?(str)
  str.each_char do |char|
    current_key = char.upcase.to_sym
    if BLOCKS.keys.include?(current_key)
      return false if str.include?(BLOCKS[current_key]) || str.count("#{char}#{BLOCKS[current_key]}") >= 2
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('BBBBBB') == false

# Further Exploration
# Did you use a different data structure for organizing your blocks? Were those blocks 2 letter strings or something else? What method did you use to check if a string had 2 letters from a single block? There are several different possibilities for solving this exercise.
