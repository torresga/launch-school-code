# Leading Substrings
# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# Input: One string
# Output: An array of substrings
# Mental models: Given a string, return a list of all substrings in order of shortest to longest.

# Examples:

# substrings_at_start('abc') == ['a', 'ab', 'abc']
# substrings_at_start('a') == ['a']
# substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Data structures
# Input is a string. Output is an array.

# Algorithm
# Create new array
# Loop String.length times
# Add a slice of string from 0 to current iteration to array

# Return array

# Code
def substrings_at_start(str)
  substrings = []

  0.upto(str.length-1) do |len|
    substrings << str[0..len]
  end

  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
