# Find Missing Numbers

# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# Examples:
#
# missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# missing([1, 2, 3, 4]) == []
# missing([1, 5]) == [2, 3, 4]
# missing([6]) == []

# Input: An array of sorted integers
# Output: All the missing elements that occur numerically between first and last elements of input

# Algorithm
# Get array of all numbers from first to least
# Select numbers from that array that do not appear in the input array
# Return new selected array

def missing(numbers)
  (numbers.first..numbers.last).to_a.select do |current_number|
    !numbers.include?(current_number)
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
