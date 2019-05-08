# PEDAC
#
# Goal: Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
#
# Identify expected input or output
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Input
# integer
# greater than 0

# Output
# integer
# greater than 0

# Create examples/test cases
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# Data Structures

# Integers for input and output
# Array to contain numbers between 1 and up to inputted number
# String to hold name of operation

# Algorithms
# Ask user to enter an integer greater than 0
# Set number = user input for an integer greater than 0
# Set number_range = array with numbers from 1 to number
#
# Ask user to enter s or p
# Set user_choice = 's' or 'p'
#
# Set operation_name = 'sum' or 'product'
#
# If s
#   Compute sum
# End
#
# If p
#   Compute product
# End
#
# Return value

# Code

number = 0
loop do
  puts ">> Please enter an integer greater than 0:"
  number = gets.chomp.to_i

  break if number > 0
end

number_range = (1..number).to_a

user_choice = ""
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  user_choice = gets.chomp

  break if user_choice == "s" || user_choice == "p"
end

if user_choice == "s"
  operation_name = "sum"
else
  operation_name = "product"
end

result = case
when user_choice == "s"
  number_range.sum
when user_choice == "p"
  number_range.reduce(&:*)
end

puts "The #{operation_name} of the integers between 1 and #{number} is #{result}."
