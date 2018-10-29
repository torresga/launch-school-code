# PEDAC
# Goal: Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# Identify expected Input or output
# Make requirements explicit
# Identify rules
# Mental models of problem

# Input: Method takes in one string argument containing one or more words. Each string argument will have only letters and spaces.
# Output: Method returns given string with all words 5 or more letters long reversed. Spaces are included only when more than one word is present.

# Create examples/test cases
# reverse_words('Professional')          # => lanoisseforP
# reverse_words('Walk around the block') # => Walk dnuora the kcolb
# reverse_words('Launch School')         # => hcnuaL loohcS

# Data Structures

# Input and output can be represented as Strings. Inside the method,
# the input string can be split into an Array to make use of array methods.

# Algorithms

# Given one string argument.

# Strip argument of extraneous spaces.
#
# Set word_list = string argument split into an array of words
# Set reversed_words = new Array
#
# Loop over word_list
# For each word in word_list
#   Reverse word if word's length is >= 5
#   Append word to reversed_words
# End Loop

# Convert reversed_words back into a string
# Return reversed_words

# Code

def reverse_words(str)
  word_list = str.strip.split(" ")
  reversed_words = []

  word_list.each do |word|
    word.reverse! if word.length >= 5
    reversed_words << word
  end

  reversed_words.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('     cookies ')
