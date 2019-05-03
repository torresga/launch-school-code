# Rotation (Part 2)

# Input: An integer
# Output: An integer
# Mental model: Given an integer, find the n digit of a number. Remove it from its' place and add it to the end of the number. Return the number.

# Examples:
# Write a method that can rotate the last n digits of a number. For example:

# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917


# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

# Data Structures

# Input and output can remain integers. Inside we can split integers into an array.

# Algorithm

# Split integer into digits.
# Get x number from right.
# Remove number
# Add it to the end of array
# Turn array into number

# Code

def rotate_rightmost_digits(number, position)
  digits = number.digits.reverse

  target = digits.slice!(digits.length-position, 1)

  digits << target

  digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
