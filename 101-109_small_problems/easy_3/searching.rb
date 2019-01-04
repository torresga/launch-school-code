# PEDAC
#
# Goal: Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.
#
#
# Identify expected input or output
# Each expected input is an integer. The expected output contains an array of integers.

# Make requirements explicit
# Get 6 numbers from the user
# Does 6th number appear among the first 5 numbers?

# Identify rules
# Mental models of problem
#
# Create examples/test cases

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
#
#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# Data Structures
# Inputs are Strings. We have to convert our inputs into Integers.
# Each input can be added into an array of Integers.

# Algorithms

# Create a numbers array.
# Get the first number
# Add the first number to the numbers array.
# Get the second number
# Add the second number to the numbers array.
# Get the third number
# Add the third number to the numbers array.
# Get the fourth number
# Add the fourth number to the numbers array.
# Get the fifth number.
# Add the fifth number to the numbers array.
# Get the last number
# If the last number appears in numbers array
#   Puts "This number exists in the numbers array"
# Else
#   Puts "This number does not exist in the numbers array"
# End

# Code

# numbers = []
#
# puts "==> Enter the 1st number:"
# number1 = gets.to_i
# puts "==> Enter the 2nd number:"
# number2 = gets.to_i
# puts "==> Enter the 3rd number:"
# number3 = gets.to_i
# puts "==> Enter the 4th number:"
# number4 = gets.to_i
# puts "==> Enter the 5th number:"
# number5 = gets.to_i
# puts "==> Enter the last number:"
# last_number = gets.to_i
#
# numbers = [number1, number2, number3, number4, number5]
#
# if numbers.include?(last_number)
#   puts "The number #{last_number} appears in #{numbers}."
# else
#   puts "The number #{last_number} does not appear in #{numbers}."
# end

numbers = []
places = ["1st", "2nd", "3rd", "4th", "5th", "last"]
last_number = 0
phrase = ""

places.each do |place|
  puts "Enter the #{place} number:"
  current_num = gets.to_i

  if place != "last"
    numbers.push(current_num)
  else
    last_number = current_num
  end
end

phrase = if numbers.include?(last_number)
           "appears"
         else
           "does not appear"
         end

puts "The number #{last_number} #{phrase} in #{numbers}."
