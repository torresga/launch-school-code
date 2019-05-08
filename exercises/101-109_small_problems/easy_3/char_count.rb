# PEDAC
#
# Goal: Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.
#
# Identify expected input or output
# Input: a String
# Output: a string

# Make requirements explicit
# Characters: spaces should not be counted as a character, but other punctuation are counted.
# Do numbers count as characters Lets count them.
# What about if we get an empty string? Empty strings split into an array have 0 length.

# Identify rules
# Mental models of problem
#
# Create examples/test cases
# Please write word or multiple words: walk
# There are 4 characters in "walk".

# Please write word or multiple words: walk, don't run
# There are 13 characters in "walk, don't run".

# Data Structures
# get input as a String
# store string internally as an array
# return output as a String

# Algorithms
# Set words = ''
# Set characters = []
# Get input from user
# Assign user input to words
# Turn words into an array that has each character as an element.
# Assign array to characters
# Remove spaces in characters
# Return count of characters

# Code

print "Please write word or multiple words: "
words = gets.chomp

# characters = words.split("").select do |word|
#               word.include?(" ") == false
#              end

characters = words.split("")
characters.select! do |word|
  word.include?(" ") == false
end

# with #chars and #each
# total_chars = []
# words.chars.each do |char|
#   next if char == ' '
#   total_chars << char
# end

# the best solution i have found:
# words.count("^ ")
puts "There are #{characters.length} characters in \"#{words}\"."
