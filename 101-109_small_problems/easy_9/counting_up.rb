# Counting Up
# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

# Input: Integer
# Output: An array
# Mental model: Given an integer greater than 0, return an array of integers between 1 and argument.

# Examples:

# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]

# Data Structure

# Input is a integer. Output is an array.

# Algorithm

# Create a counter
# Create a new array
# Until counter is greater than input
#   Add counter to array
#   Add 1 to counter

# Return array

# Code

def sequence(number)
#   counter = 1
#   sequence = []

#   until counter > number
#     sequence << counter
#     counter += 1
#   end

#   sequence

  return (number..1).to_a.reverse if number < 0

  (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-1) == [1, 0, -1]

# Further Exploration
# Food for thought: what do you think sequence should return if the argument is not greater than 0. For instance, what should you do if the argument is -1? Can you alter your method to handle this case?

# I think the sequence should return 1 to the negative number.
