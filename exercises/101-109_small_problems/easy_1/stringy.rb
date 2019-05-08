# PEDAC
# Goal: Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.
#
# Identify expected input or output
# Make requirements explicit
# Identify rules
# Mental models of problem
# Expected input: one positive integer
# Expected output: one string of length integer composed of altenating 1s and 0s always starting with 1.
# Since output numbers start with 1, this means that all odd numbers are 1s and all even numbers are 0s <- assuming that you are counting from 1 and not zero of course.
#
# Create examples/test cases to validate understanding of problem
#
# stringy(6) => '101010'
# stringy(9) => '101010101'
# stringy(4) => '1010'
# stringy(7) => '1010101'
#
# Data Structure
# Input is an Integer. Output is a String. Inside the method, we can create a new string.
#
# Algorithm
# Set stringy = ''
# Set counter = 1
# Loop
#   Append to stringy "1" if counter is odd
#   Append to stringy "0" if counter is even
#   Break if string length is equal to number
# End Loop

#
# Code

# def stringy(number)
#   stringy = ''
#   counter = 1
#
#   loop do
#     stringy << "1" if counter.odd?
#     stringy << "0" if counter.even?
#     counter += 1
#     break if stringy.length == number
#   end
#
#   stringy
# end
#
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Further Exploration
# Modify stringy so it takes an optional argument that defaults to 1.
# If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(number, starts_with = 1)
  stringy = ''
  counter = 1

  if starts_with == 0
    counter = 0
  end

  loop do
    stringy << "1" if counter.odd?
    stringy << "0" if counter.even?
    counter += 1
    break if stringy.length == number
  end

  stringy
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'
