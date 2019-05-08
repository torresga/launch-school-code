# Rotation (Part 1)
# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Input: An array
# Output: A new array
# Mental Model: Given an array, create a new array with the first element moved to the last array. Return the new array.

# Example:

# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# Data Structure

# Input and output are arrays.

# Algorithm

# Create a copy of the array.
# Take the first element off the copied array
# Push it to the end of the copied array

# Code

def rotate_array(arr)
  copied_arr = arr.dup

  copied_arr << copied_arr.shift

  copied_arr
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Further Exploration
# Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.

def rotate_str(str)
  rotate_array(str.split("")).join
end

p rotate_str("abc") # "bca"

def rotate_int(int)
  rotate_array(int.digits.reverse).join.to_i
end

p rotate_int(12) # 21
