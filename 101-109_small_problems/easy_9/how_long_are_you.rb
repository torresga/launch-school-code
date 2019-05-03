# How long are you?
# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

# Input: A string
# Output: An array
# Mental model: Given a string, return an array containing every word from the string appended with a space and the word length.

# Examples

# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# word_lengths("") == []

# Data Structure

# Input is a string. Output is an array of strings.

# Algorithm

# Split string into an array of strings.
# Loop over the array
# Append a space to current string
# Append the current string's length to string.

# Return array

# Code

def word_lengths(str)
  words = str.split

  words.map do |word|
    "#{word} #{word.length}"
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
