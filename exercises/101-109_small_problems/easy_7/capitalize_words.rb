# Capitalize Words
# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Input: A string argument
# Output: A string
# Mental model: Given a string argument, create a string that downcases all words in the string and capitalizes the first letter of each word.

# Examples

# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Data structure

# Input and output are strings. Input can be split into words.

# Algorithm

# Downcase string
# Create new array
# Split string into array
# Loop through array
#   Add capitalized word to new string

# Code

def word_cap(str)
  str = str.downcase
  capitalized = []

  str.split(" ").each do |word|
    capitalized_word = word[0].upcase + word[1..-1]
    capitalized << capitalized_word
  end

  capitalized.join(" ")
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration
# Ruby conveniently provides the String#capitalize method to capitalize strings. Without that method, how would you solve this problem? Try to come up with at least two solutions.

def word_cap(str)
  words = str.downcase.split(" ")
  counter = 0

  loop do
    words[counter][0] = words[counter][0].upcase
    counter += 1

    break if counter == words.size
  end
  words.join(" ")
end

p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') #== 'The Javascript Language'
p word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'
