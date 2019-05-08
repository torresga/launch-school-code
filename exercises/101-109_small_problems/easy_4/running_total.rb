# Running total
# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# Input: an array of Integers (includes positive and negative and zero)
# Output: a new array, of the original array's length

# Make requirements explicit:
# First element is first element in the original array
# Second element is original first element + original second element
# Third element is original first + second + third
# etc..
# Last element is the sum of all elements of the array

# An empty array should return an empty array

# Examples:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# Data Structures
# Both our inputs and outputs will be arrays.
# We will be creating a new array
# Keep track of our current sum as an integer inside a variable, can push current sum into new array

# Algorithm
# Create new output array
# Create sum variable

# If input array is empty?
#   Return empty output array
# End

# Loop through each element of input array
#   Add element to sum
#   Add sum to output array

# Return output array

# Code

def running_total(numbers)
  running_totals = []
  sum = 0

  if numbers.length == 0
    return running_totals
  end

  numbers.each do |number|
    sum = sum + number
    running_totals << sum
  end

  running_totals
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([])  == []
puts running_total([-2, 5, -13]) == [-2, 3, -10]

# Further Exploration
# Try solving this problem using Enumerable#each_with_object or Enumerable#inject (note that Enumerable methods can be applied to Arrays).

# Enumerable#each_with_object
def running_total(numbers)
  sum = 0

  numbers.each_with_object([]) do |int, arr|
    sum = sum + int
    arr << sum
  end

end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([])  == []
puts running_total([-2, 5, -13]) == [-2, 3, -10]

# Enumerable#inject
def running_total(numbers)
  total = []

  numbers.each_with_index do |_, index|
    total << numbers[0..index].inject do |sum, n|
      sum + n
    end
  end

  total
end

puts "\n"
print running_total([2, 5, 13]) # == [2, 7, 20]
print running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
print running_total([3]) #== [3]
print running_total([])  #== []
print running_total([-2, 5, -13]) #== [-2, 3, -10]
