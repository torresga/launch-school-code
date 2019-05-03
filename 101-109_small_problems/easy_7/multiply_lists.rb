# Multiply Lists
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

# Input: two array arguments
# Output: New array
# Mental model: Given two arrays, multiply the elements of each array that have the same index together.

# Examples:

# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Data structures

# Input is two arrays. Output is one array.

# Algorithm
# Create new array
# Loop through first array
# Loop through second array
#   Multiply elements together
#   Assign product to new array
# Return new array

# Code
def multiply_list(arr1, arr2)
  products = []
  counter = 0

  loop do
    products << (arr1[counter] * arr2[counter])

    counter += 1
    break if counter == arr1.length
  end

  products
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Further Exploration
# The Array#zip method can be used to produce an extremely compact solution to this method. Read the documentation for zip, and see if you can come up with a one line solution (not counting the def and end lines).

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|a, b| a * b }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
