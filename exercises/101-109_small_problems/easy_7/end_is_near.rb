# The End Is Near But Not Here
# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# Input: A string
# Output: The next to last word in the string
# Mental model: Given a string of words, find the next to last word and return it.

# Examples:

# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'

# Data Structure

# Input and output are strings. Input can be split into an array words.

# Algorithm

# Split string into an array of words.
# Return the word at index -2.

# Code

def penultimate(str)
  words = str.split

  words[-2]
end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# Further Exploration
# Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

# Edge cases:

# What if the string had no words? Return an empty string
# What if the string had one word? Return a string with one word.
# What if the string has an even number of words? Return next to last
# Otherwise, return middle

def middle(str)
  words = str.split

  return "" if words.empty?

  middle = words.length.even? ? -2 : (words.length / 2.0).floor

  words[middle]
end

p middle('last word') == 'last'
p middle('Launch School is great!') == 'is'
p middle('this is the end of the world') == 'end'
p middle('hello my darling') == 'my'
p middle("hello") == "hello"
