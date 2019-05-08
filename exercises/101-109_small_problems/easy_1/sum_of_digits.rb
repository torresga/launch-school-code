# PEDAC
# Goal: Write a method that takes one argument, a positive integer, and returns the sum of its digits. For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

# Identify Expected Input or output
# Make requirements explicit
# Identify rules
# Mental models of problem

# Input: One positive integer
# Output: One positive integer
# No basic looping constructs

# Create examples/test cases
# puts sum(23) => 5
# puts sum(496) => 19
# puts sum(123_456_789) => 45

# Data structures
# Input is an Integer
# Output is an Integer

# Algorithm
# Given a positive integer.
#
# Break up integer into an array.
# Set sum = 0;
# For each integer in array,
#  Add Integer version of integer to sum
# Return sum

# Code

def sum(number)
  numbers = number.to_s.chars

  numbers.reduce {|sum, i| sum.to_i + i.to_i }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
