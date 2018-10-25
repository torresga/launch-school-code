# PEDAC

# Identify expected Input or output
# Make requirements explicit
# Identify rules
# Mental models of problem

# Input: Method takes in one string argument
# Output: Method returns one string with words in reverse order.

# Create examples/test cases
# reverse_sentence('') => ''
# reverse_sentence('Hello World') => 'World Hello'
# reverse_sentence('Reverse these words') => 'words these Reverse'

# Data Structures

# Input and output can be represented as Strings. Inside the method,
# the input string can be split into an Array to make use of array methods.

# Algorithms

# Given one string argument.
#
# Set word_list = string argument split into an array of words
# Set reversed_words = new Array
#
# Loop over word_list in reverse
#   Append word to reversed_words
# End Loop
#
# Convert reversed_words back into a string
# Return reversed_words

# Code

def reverse_sentence(sentence)
  word_list = sentence.split(" ")
  reversed_words = []

  # For some reason couldn't find Array#reverse the first time.
  # Could also use a loop, with counter starting at word_list.length-1,
  # counter decrementing by one, and the loop stops if counter == 0
  word_list.reverse_each do |word|
    reversed_words << word
  end

  reversed_words.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
