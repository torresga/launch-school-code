# Convert a String to a Signed Number!
# In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

# Input: A string of digits
# Output: Appropriate number as an integer with - if it is negative

# Add - only if the string contains a -, otherwise disregard sign

# Examples

# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

# Data structures
# A hash as a lookup table to convert strings to numeric values
# An array to internally work with both characters and numbers
# Output is an integer

# Algorithm
# Break input string into array of characters
# Remove sign from characters
# Add sign to new variable sign
# Create new array
# Loop through character array
#   add hash values to new array
# Return new array

# Reduce array to sum
# Multiply sum by -1

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

def string_to_signed_integer(number)
  numerical_chars = number.chars
  sign = numerical_chars.shift if numerical_chars.include?("+") || numerical_chars.include?("-")

  integers = numerical_chars.map do |char|
              STRINGS_TO_INT[char.to_sym]
  end

  sum = integers.reduce do |sum, num|
    sum * 10 + num
  end

  sign == "-" ? sum * -1 : sum
end

# puts string_to_signed_integer("-123")
# puts string_to_signed_integer('4321') == 4321
# puts string_to_signed_integer('-570') == -570
# puts string_to_signed_integer('+100') == 100

# Further Exploration
# In our solution, we call string[1..-1] twice, and call string_to_integer three times. This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.

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

def string_to_signed_integer(string)
  string.slice!(0) if string[0].include?("+")

  if string[0].include?("-")
    -string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

puts string_to_signed_integer("-123") == -123
puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
