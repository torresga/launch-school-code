# Convert a Number to a String!

# In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

# Input: 0 or a positive integer
# Output: A string containing zero or positive integer

# Mental model: Turning an integer into a string without using to_s, String(), Kernel#format, etc.

# Examples

# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# Data structure
# Hash to contain Integers as keys and Strings as values

# Somehow turn the number into an array - thats how we can work with number inside of the method

# Create string as output, mutate output string that we return to user

# Algorithm
# Break Integers into an array
# Create new string

# Loop through integer array
#   Append value of hash to string

# Return string

# Code
NUM_VALUES = {
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
  0 => "0"
}

def integer_to_string(number)
  int_string = ""
  integers = number.digits.reverse

  integers.each do |int|
    int_string << NUM_VALUES[int]
  end

  int_string
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

# Further Exploration
# One thing to note here is the String#prepend method; unlike most string mutating methods, the name of this method does not end with a !. However, it is still a mutating method - it changes the string in place.

# This is actually pretty common with mutating methods that do not have a corresponding non-mutating form. chomp! ends with a ! because the non-mutating chomp is also defined. prepend does not end with a ! because there is no non-mutating form of prepend.

# How many mutating String methods can you find that do not end with a !. Can you find any that end with a !, but don't have a non-mutating form? Does the Array class have any methods that fit this pattern? How about the Hash class?


Mutating strings that do not end with a !
  String#clear
  String#concat
  String#replace
  String#insert
  String#prepend
  <<

Mutating arrays that do not end with a !
  Array#<<
  Array#append
  Array#clear
  Array#concat
  Array#delete_if
  Array#insert
  Array#keep_if
  Array#replace
  Array#unshift
  Array#prepend
  Array#shift

Mutating hashes that do not end with a !
  Hash#clear
  Hash#delete_if
  Hash#rehash
  Hash#replace
  Hash#shift
  Hash#update
