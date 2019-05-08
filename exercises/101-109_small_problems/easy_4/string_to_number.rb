# Convert a String to a Number!
# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# Input: A string of numeric characters
# Output: An object of the type integer
# Mental Models/ Explicit requirements:

# Do not worry about + or minus
# Assume all characters are numeric
# No #to_i, Integer()

# calculate the result by analyzing the characters in the string. - is this the key? is the number 4321 the same as '4'.ord + '3'.ord + '2'.ord + '1'.ord?

# character code for integers represented by strings is different than the integers => '4'.ord != 4

#   is there a lookup table, or a hash, for numeric values
#   '1' => 1
#   '2' => 2
#     etc

#     determining ones, tens, and hundreds places
#     getting integer values from hash
#     sum = (4 * 1000) + (3 * 100) + (2 * 10) + (1 * 1)

# Examples

# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# sum method
# 4, 3, 2, and 1 => 4,321
# (4 * 1000) + (3 * 100) + (2 * 10) + (1 * 1)

# How do we determine ones, tens, hundreds, and thousands place, even longer, of a number.

# Data structures
# Hash: key value is string representation of integer, value is the integer.

# Input string of numerical characters can be split into an array, with each element containing one numerical character

# Add together a sum, an Integer - ones + tens + hundreds + thousands

# Algorithm
# Create a hash.

# Reverse string
# Split the numerical string into an array of characters
# Create new array for integer representations

# Loop through array of characters
#   Lookup character in hash
#     Append value to new integer array

# Pass integer array into sum method

  # sum method takes an array
#   counter variable starting at 1
#   create new array
#   loop through old array
#     multiply current value * counter
#     assign product to new array
#     counter = counter * 10
#     break if old array size == counter

# Reduce new array
  # Return that array

# Code
STRINGS_TO_INT = {
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
  '0': 0
}

def sum(arr)
  numbers = []
  places = 1
  counter = 0

  loop do
    numbers << arr[counter] * places
    places = places * 10
    counter = counter + 1
    break if arr.size == counter
  end

  numbers.reduce(:+)
end

def string_to_integer(str)
  ints = []
  numerical_chars = str.reverse.chars

  numerical_chars.each do |char|
    ints << STRINGS_TO_INT[char.to_sym]
  end

  sum(ints)
end


puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
puts string_to_integer('0001') == 0001
puts string_to_integer('90210') == 90210
puts string_to_integer('19404020302010302010103020202') == 19404020302010302010103020202

# Further Exploration
# Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

# Example:

# hexadecimal_to_integer('4D9f') == 19871

# Input: String representing a hexadecimal number
# Output: An integer value

# Make sure to convert letters to uppercase before looking for them in hash

# Data structures
# Hash: a hash containing string of hex to integer values




# Algorithm
# Break input string into characters

# Create a new array with characters from string converted to integers

# Add numbers together

# Return number

#
HEX_VALS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15
  }

def sum(arr)
  numbers = []
  places = 1
  counter = 0

  loop do
    numbers << arr[counter] * places
    places = places * 16
    counter = counter + 1
    break if arr.size == counter
  end

  numbers.reduce(:+)
end

def hexadecimal_to_integer(str)
#   ints = []
#   numerical_chars = str.reverse.chars

#   numerical_chars.each do |char|
#     ints << HEX_VALS[char.upcase]
#   end

#    sum(ints)

  numerical_chars = str.chars.map do |char|
    HEX_VALS[char.upcase]
  end


  numerical_chars.reduce do |sum, n|
    (sum * 16) + n
  end
end

print hexadecimal_to_integer('4D9f') == 19871
