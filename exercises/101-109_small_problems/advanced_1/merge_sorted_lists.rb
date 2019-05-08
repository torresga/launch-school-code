# Merge Sorted Lists
# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

# Input: two sorted arrays, They aren't necessarily same length
# Output: One new array containing elements from both arguments in sorted order. Do not add arrays together and sort.

# Build result array in proper order

# Loop over each element of first array
# Loop over each element of second array

# Each element in input1 array and input2 array are sorted
# but are first array and second array sorted- meaning will second array's elements be larger than the first?

# If one of the arrays are empty - add rest of elements to new array

# Data Structures
# Input and output are arrays

# Algorithm
# Return second array if first array is empty
# Return first array if second array is empty
# Return [] if both arrays are empty

# Instead of looping over the arrays - can we just use a loop?
# Possibly duplicate each array, so we don't mutate
# Take off first element of each array
# if first element is less than second element
#   Add first element to new array
#   Get next element
# Else if first element is greater than second element
#   Add second element to new array
#   Get next element
# Else if they're equal
#   Add both first and second element to new array
#   Get next element for both

# Break when both input arrays are empty

# Code

require 'pry'

def merge(arr1, arr2)
  return [] if arr1.empty? && arr2.empty?
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?

  first = arr1.clone
  second = arr2.clone
  merged = []

  first_elem = first.shift
  second_elem = second.shift
  loop do
    if first_elem.nil? || second_elem.nil?
      merged << first_elem
      merged << second_elem
      break
    end

    if first_elem < second_elem
      merged << first_elem
      first_elem = first.shift
    elsif first_elem > second_elem
      merged << second_elem
      second_elem = second.shift
    else
      merged << first_elem
      merged << second_elem
      first_elem = first.shift
      second_elem = second.shift
    end

  end

  merged.reject {|x| x == nil }

end

# Examples:

# p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]

# Create new array
#   Look at 1 and 2.
#   1 is less than 2
#   Add 1 to new array: [1]
#   Get next item after 1.
#   Look at 2 and 5
#   2 is less than 5
#   Add 2 to new array: [1, 2]
#   Get next item after 2.
#   Look at 5 and 6
#   5 is less than 6
#   [1, 2, 5]
#   Look at 6 and 9
#   6 is less than 9
#   [1, 2, 5, 6]
#   Look at 9 and 8
#   8 is less than 9
#   [1, 2, 5, 6, 8, 9]

p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
p merge([1], [2, 2]) #=> [1, 2, 2]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]
# p merge([], []) == []
