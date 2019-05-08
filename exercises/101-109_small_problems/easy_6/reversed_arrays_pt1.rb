# Reversed Arrays (Part 1)
# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# Input: An array
# Output: The same array, but reversed
# Mental model: Given an array, reverse its elements in place. Return array.

# Examples:

# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1]
# list == [4, 3, 2, 1]
# list.object_id == result.object_id

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"]
# list == ["c", "d", "e", "b", "a"]

# list = ['abc']
# reverse!(list) == ["abc"]
# list == ["abc"]

# list = []
# reverse!(list) == []
# list == []

# Data structure
# Input and output are arrays.

# Algorithm
# Assign 1 to counter
# Loop through array
#   Assign element into a first variable
#   Assign last element into a last variable
#   Assign first element to last
#   Assign last element to first
#   Counter += 1
#   Break if counter-1 == arr.length/2


# Code
def reverse!(arr)
  counter = 1

  loop do
    break if counter-1 == arr.length/2

    first = arr[counter-1]
    last = arr[arr.length-counter]

    arr[counter-1] = last
    arr[arr.length-counter] = first

    counter += 1
  end

  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []
