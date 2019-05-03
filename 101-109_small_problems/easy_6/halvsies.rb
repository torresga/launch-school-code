# Halvsies
# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

# Input: One array
# Output: A nested array - two arrays inside an outer array
# Mental model: Given an array, create a new nested array that contains two inner arrays. Both arrays will contain each half (first half will contain half + 1 if an odd number) of the original array.

# Examples:

# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]

# Data structure
# Input is an array. Output is a nested array.

# Algorithm

# Create new array
# If input array length is odd?
#   Take first half + 1 of array and place it into arr1
#   Take other half of array and place it into arr2
# Else
#   Split array evenly into arr1, arr2
# Add both arrays to new array
# Return new array

# Code

def halvsies(arr)
  arr1, arr2 = []
  length = arr.length

  if length.odd?
    arr1 = arr[0...(length/2 + 1)]
  else
    arr1 = arr[0...(length/2)]
  end

  arr2 = arr - arr1

  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Further Exploration
# Can you explain why our solution divides array.size by 2.0 instead of just 2?

# Dividing array.size by 2.0 returns a floating point number. #ceil is a method called on floats.

# This is but one way to solve this problem. What solution did you end up with? Was it similar or entirely different?
