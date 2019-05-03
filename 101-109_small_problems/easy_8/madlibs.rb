# Madlibs
# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

# Input: Four strings
# Output: A string containing 4 input strings
# Mental model: Given a noun, a verb, an adverb, and an adjective, write a sentence that contains all 4 input strings.

# Example

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

# Data structure

# Input and output are strings.

# Algorithm

# Get noun
# Get verb
# Get adjective
# Get adverb
# Create a new string with noun verb adjective and adverb.

# Code

print "Enter a noun: "
noun = gets.chomp

print "Enter a verb: "
verb = gets.chomp

print "Enter an adjective: "
adjective = gets.chomp

print "Enter an adverb: "
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
