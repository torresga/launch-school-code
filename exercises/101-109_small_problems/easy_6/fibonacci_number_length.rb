# Fibonacci Number Location By Length
# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# Input: An integer greater than or equal to 2
# Output: An integer representing the length of the array of fibonacci numbers.
# Mental model: Given an integer argument greater than or equal to 2, calculate the fibonacci numbers up to the first number that has the same digits as argument. Return the length of the resulting array.

# Examples:

# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847
#  You may assume that the argument is always greater than or equal to 2.

# Data structures
# Input and output are integers, but internally fibonacci numbers can be an array.

# Algorithm
# Get input argument
# Assign to fibonacci_numbers the array [1, 1]
# While the digits of last number of fibonacci_numbers is < input
#   Add to fibonnaci_numbers the sum of the last number and the number before it

# Return the length of the fibonacci_numbers array

# Code
def find_fibonacci_index_by_length(num_size)
  fibonacci_numbers = [1, 1]
  counter = 2

  while fibonacci_numbers.last.digits.length < num_size
    fibonacci_numbers << (fibonacci_numbers[counter-1] + fibonacci_numbers[counter-2])
    counter += 1
  end

  fibonacci_numbers.length
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
