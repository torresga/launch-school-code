# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Input: A positive integer
# Output: An integer representing the difference of the sum of the first n digits squared - the sum of the first n squared digits.

# Examples:

# sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150

# Data Structures

# Can use two arrays - one to collect digits, one to collect squares

# Algorithm

# Create digits array
# Create squares array

# Create a range from 1 to number

# Loop n times

# Add integers to digits array
# Add squares to squares array

# Return integers sum squared - squres.sum

# Code

def sum_square_difference(number)
  digits = []
  squares = []

  1.upto(number) do |num|
    digits << num
    squares << num**2
  end

  (digits.sum)**2 - squares.sum
end

p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
