# PEDAC
# Goal: Build a program that randomly generates and prints Teddy's age. To get the age you should generate a random number between 20 and 200.

# Identify Expected Input or Output
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Input: None
# Output: A random Integer between 20 and 200.
# Teddy's age is randomly generated.
# We will make explicit that our range includes our end numbers of 20 and 200.
#
# Create examples/test cases to validate understanding of problem
#
# Example output:
# Teddy is 69 years old!
#
# Data Structures
# Output is an Integer
#
# Algorithm
#
# Generate a random number between 20 and 200.
# Output random number
#
# Code
#

# puts "Teddy is #{rand(20..200)} years old!"

# Further Exploration
# Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

puts "Enter a name:"
input = gets.chomp
name = input.empty? ? 'Teddy' : input

puts "#{name} is #{rand(20..200)} years old!"
