# Zipper
#
# The Array#zip method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order. For example:
#
# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
#
# Write your own version of zip that does the same type of operation. It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.
#
# Example:
#
# zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Input: Two arrays, each has the same number of elements
# Output: An array of arrays.

# Each inner array contains the elements of the first and last arrays, same index

# Loop through first array, with index
# Create a new array with both elements of the same index
# Return new array
def zip(first_array, second_array)
  first_array.map.with_index do |elem, idx|
    [elem, second_array[idx]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

p zip([1, 2], [3, 4])
p zip([], [])
p zip([1, 2, 3, 4, 5], [6, 7, 8, 9, 10])
