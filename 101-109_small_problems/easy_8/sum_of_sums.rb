# Sum of Sums
# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# Input: An array of numbers
# Output: An integer
# Mental model: Given an array of numbers, calculate the sum

# Examples:

# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

# Data structure

# Input is an array. Output is an integer.

# Algorithm
# Create counter
# Create sum variable
# Loop through array
#   Multiply array.length - counter * current_element
#   Add result to sum
#   Add 1 to counter

# Return sum

# Code
def sum_of_sums(arr)
  sum = 0
  counter = 0

  loop do
    sum += (arr.length - counter) * arr[counter]
    counter += 1
    break if arr.length == counter
  end

  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
