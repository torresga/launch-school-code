# PEDAC
#
# Goal: Create a method that takes two arguments, multiplies them together, and returns the result.
#
#
#  Identify Expected Input or Output
# Input: Two integer arguments
# Output: One integer
#
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Input is two integer arguments
# What happens if 1 or more arguments are strings? floats?
#
# Create examples/test cases
# multiply(5, 3) == 15 => true
#
# Data Structures
# Input and output can be Integers.
#
# Algorithm

# Get first Integer
# Get second Integer
# Multiply first by second
# Return result

#
# Code
# Using the multiplication operator
def multiply(first, second)
  first * second
end

first_number, second_number = 0

puts "Enter the first number: "
first_number = gets.to_i

puts "Enter the second number:"
second_number = gets.to_i

puts multiply(first_number, second_number) == 15


# Discussion question
# For fun: what happens if the first argument is an Array? What do you think is happening here?
# irb(main):073:0> multiply([1, 2, 3], 2)
# => [1, 2, 3, 1, 2, 3]
# This is happening because an array also has a '*' method. The '*' method takes an integer argument (n) and returns a new array containing the values of the first array n times.
