# PEDAC
#
# Goal: Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.
#
#
# Identify expected input or output

# Input: two positive integers
# Output:
# Addition of two numbers
# Subtraction of two numbers
# Product of two numbers
# Quotient of two numbers
# Remainder of two numbers
# Power of two numbers

# Make requirements explicit
# Each number has to be positive
# But we don't have to validate input

# Identify rules
# Mental models of problem
#
# Create examples/test cases

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# Data Structures
# First and second numbers can be integers.

# Algorithms
# Get first number from the user.
# Get second number from the user.
#
# Compute addition of first number and second number.
# Display addition.
# Compute subtraction of first number and second number.
# Display subtraction.
# Compute multiplication of first number and second number.
# Display multiplication.
# Compute division of first number and second number.
# Display division.
# Compute modulo of first number and second number.
# Display modulo.
# Compute power of first number to second number.
# Display power.

# Code

def prompt(text)
  puts "==> #{text}"
end

prompt "Enter the first number:"
first_number = gets.to_i

prompt "Enter the second number:"
second_number = gets.to_i

# calculations = {
#   :+ => first_number + second_number,
#   :- => first_number - second_number,
#   :* => first_number * second_number,
#   :/ => first_number / second_number,
#   :% => first_number % second_number,
#   :** => first_number ** second_number
# }
#
# calculations.each do |operation, result|
#   prompt "#{first_number} #{operation.to_s} #{second_number} = #{result}"
# end

# Can we also try with eval and other methods?

#  with eval and #each
operators = %w(+ - * / % **)
# operators.each do |operation|
#   prompt "#{first_number} #{operation} #{second_number} = #{eval "#{first_number} #{operation} #{second_number}"}"
# end

# with #send and #each
# operators.each do |operation|
#   # We can use public_send instead, that might be a better solution because #send also calls private methods, and we don't want to call private methods because we don't want objects to be able to access those methods.
#   result = first_number.send(operation, second_number)
#   prompt "#{first_number} #{operation} #{second_number} = #{result}"
# end

# operators.each do |operation|
#   # we can also use #reduce here as reduce is an alias to inject, which for me makes more sense
#   result = [first_number, second_number].inject(operation.to_sym)
#   prompt "#{first_number} #{operation} #{second_number} = #{result}"
# end

# operators.each do |operation|
#   meth = first_number.method(operation.to_sym)
#   result = meth.call(second_number)
#   prompt "#{first_number} #{operation} #{second_number} = #{result}"
# end

# addition = first_number + second_number
# prompt "#{first_number} + #{second_number} = #{addition}"
#
# subtraction = first_number - second_number
# prompt "#{first_number} - #{second_number} = #{subtraction}"
#
# multiplication = first_number * second_number
# prompt "#{first_number} * #{second_number} = #{multiplication}"
#
# division = first_number / second_number
# prompt "#{first_number} / #{second_number} = #{division}"
#
# modulo = first_number % second_number
# prompt "#{first_number} % #{second_number} = #{modulo}"
#
# power = first_number ** second_number
# prompt "#{first_number} ** #{second_number} = #{power}"

# Discussion
# There are some edge cases to consider in this exercise. We have to be careful of not having a second number that is zero. What if we wanted to use floats instead of integers? How does this change this problem?
# Floats make the calculations more exact, since the fractional point is not dropped off like in the integer version.
# Also when working with integers, I found myself getting a warning: warning: in a**b, b may be too big
