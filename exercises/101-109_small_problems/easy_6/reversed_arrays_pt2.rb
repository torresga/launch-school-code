# Reversed Arrays (Part 2)
# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

# Input: An array
# Output: A new array
# Mental model: Given an array, return a new array of the elements in reverse order without modifying the original list.

# Examples:

# reverse([1,2,3,4]) == [4,3,2,1]          # => true
# reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# reverse(['abc']) == ['abc']              # => true
# reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]                 # => true

# Data structures
# Input is an array. Output is an array different from the input array.

# Algorithm
# Create new array
# Create counter
# Loop through array starting at the last element
#   Add array to new array
# Return new array

# Code
def reverse(arr)
  reversed_arr = []
  counter = arr.length - 1

  return reversed_arr if arr.empty?

  loop do
    reversed_arr << arr[counter]

    break if counter == 0
    counter -= 1
  end
  reversed_arr
end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true

# Further Exploration
# An even shorter solution is possible by using either inject or each_with_object. Just for fun, read about these methods in the Enumerable module documentation, and try using one in your reverse method.

def reverse(arr)
  arr.inject([]) {|a, i| a.prepend(i) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == [] # => true
