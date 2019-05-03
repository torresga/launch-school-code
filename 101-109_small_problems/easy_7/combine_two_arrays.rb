# Combine Two Lists
# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# Input: Two arrays
# Output: One new array
# Mental model: Given two arrays, create a new array that has both arrays intertwined with each other.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# Example:

# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Data structures

# Both input and output are arrays.

# Algorithm
# Create a new array
# Loop through first array
# Loop through second array
#   Add to new array element of first array
#   Add to new array element of second array

# Return array
# Code

def interleave(arr1, arr2)
  combined = []
  counter = 0

  loop do
    combined << arr1[counter]
    combined << arr2[counter]

    counter += 1
    break if counter == arr1.size
  end
  combined

  # arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Further Exploration
# Take a few minutes to read about Array#zip. #zip doesn't do the same thing as interleave, but it is very close, and more flexible. In fact, interleave can be implemented in terms of zip and one other method from the Array class. See if you can rewrite interleave to use zip.
