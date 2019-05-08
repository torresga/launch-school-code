# Combining Arrays
# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

# Input: Two arrays
# Output: A new array
# Mental model: Given two arrays, create a new array that has unique values from each array and return it.

# Example

# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Data structure:

# Input and output are both arrays.

# Algorithm:
# Add both arrays together
# Remove duplicate elements
# Return new array

# Code:

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Further Exploration
# How did you go about solving this one? Using this method for set union is convenient, but what if we didn't have it? There are certainly a few other ways to go about solving this exercise.

# In my solution I added the two arrays together and called the #uniq method on the new array, returning only the unique elements of the array.
