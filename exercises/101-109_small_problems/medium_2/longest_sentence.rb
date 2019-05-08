# Longest Sentence
# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words.
# Sentences may end with periods (.), exclamation points (!), or question marks (?).
# Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.
# You should also print the number of words in the longest sentence.
#
# Input: A text file
# Output: Sentence with the most words
# Mental model: Given a text file, find the sentence with the most words.
# Return number of words in the longest sentence.

# Sentences end with . ! or ?

# Any sequence of characters that are not spaces or sentence ending characters should be treated as a word.
#
# File.open.each reads each line as ending with a \n
# Our sentences end with punctuation.
# Best way to do this: read file as a string, remove \n from string and then split on punctuation.
# Example:
# Text starts with:
# Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal. ....
# Script returns :
# The longest sentence is :
# It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.
#
# and is 86 words long. (Note that each -- counts as a word.)
# #
# Data structures

# Input is a text file - can we use an array to store previous string + current string like with fibonacci
# or maybe store in a variable
#
# Algorithm
# Create new str lines
# Loop through text file
#   Add each line to string text without newlines

# Create new lines array
# Split string into lines array

# Loop through lines array
# Split each line into words
# Select line that has most words

# Return longest line
# Return longest line length

#
# Code

def get_longest_line(file)
  lines = ""

  File.open(file).each do |line|
    lines << line.gsub(/\n/, " ")
  end

  words = lines.split(/[.?!]/).map do |line|
    line.split
  end

  longest_line = words.sort_by! {|line| line.length }.last
end

def display_line(line)
  puts "The longest sentence is: "
  puts "#{line.join(" ")}"
  puts "and is #{line.length} words long."
end

def longest_line(file)
  longest_line = get_longest_line(file)

  display_line(longest_line)
end

longest_line("longest_sentence.txt")
longest_line("84-0.txt")

# Further Exploration
# You may have noticed that our solution fails to print the period at the end of the sentence. Can you write a solution that keeps the period printed at the end of each sentence?
#
# What about finding the longest paragraph or longest word? How would we go about solving that problem?
