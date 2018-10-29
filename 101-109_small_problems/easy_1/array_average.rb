# PEDAC
# Goal: Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

# Identify Expected Input and output
# Make requirements explicit
# Identify rules
# Create mental models of problem
# Input: A non-empty array full of positive integers.
# Output: A positive integer.
# Do the words 'never' and 'always' mean that we do not have to check for empty arrays or negative integers in our array?

# Create examples/test cases to validate understanding of problem
# average([1, 5, 87, 45, 8, 8]) => 25
# average([9, 47, 23, 95, 16, 52]) => 40

# Data structures
# Input -> array
# Output -> an integer

# Algorithm
# Given an array of integers.
# Set total = 0.
# Loop through the array.
# For each element in array,
#   Add element to total.
# End Loop
#
# Return total / length of elements in array
# Code

def average(arr)
  total = 0
  counter = 0

  loop do
    total += arr[counter]
    counter += 1
    break if counter == arr.size
  end

  # Further Exploration: change average from Integer to Float
  # We can do this by either calling the method to_f on the divisor or the dividend.
  total / arr.length

  # Without a Loop
  # arr.sum / arr.length (or arr.size)
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
