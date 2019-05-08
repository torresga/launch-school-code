# Multiply All Pairs
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# Input: Two arrays
# Output: A new array that contains the product of every pair of numbers
# Mental model: Given two array elements, multiply each element in array 1 with each element in array 2. Return products in new array.

# Examples:

# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Data structures

# Input and output are arrays.

# Algorithm

# Create new array
# Loop through array1
#   Loop through array2
#     Multiply current element in array1 * current element in array2
#     Add product to new array

# Return new array

# Code
def multiply_all_pairs(arr1, arr2)

  pairs = arr1.map do |elem1|
    arr2.map do |elem2|
      elem1 * elem2
    end
  end
  pairs.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Further Exploration
# What do you think? Did you go about solving this exercise differently? What method did you end up using?
