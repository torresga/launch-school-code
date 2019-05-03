# Does My List Include This?
# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

# Input: One array and one search value
# Output: A boolean
# Mental model: Given two arguments, determine if the second argument is included in the array. Return a boolean stating whether the search value exists in the array.

# Examples:
# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false

# Data structures
# Two input values, an array and an argument. Output is boolean.

# Algorithm
# Return false if the array is empty
# Loop through array
#   If current element is equal to argument
#     return true

# Return false

# Code

# def include?(arr, search_value)
#   counter = 0

#   return false if arr.empty?

#   loop do
#     if arr[counter] == search_value
#       return true
#     end

#     break if counter == arr.size
#     counter += 1
#   end

#   false

# end

def include?(array, value)
  array.any? {|x| x == value }
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Further Exploration
# Can you think of other solutions to this problem? There are lots of different ways to get the same result.
