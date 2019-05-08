# All Substrings
# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the previous exercise.

# Input: String
# Output: A list of all substrings for the string
# Mental model: Given a string, find all possible substrings.

# Examples:

# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# Data Structure
# Input is a string
# Output is a string
# Input can be converted into an array of strings.

# Algorithm
# Create new array
# Loop string.length times
# Add to array the substrings of that substring
# Return flattened array

# Code

def substrings_at_start(str)
  substrings = []

  0.upto(str.length-1) do |len|
    substrings << str[0..len]
  end

  substrings
end

def substrings(str)
  all_substrings = []

  0.upto(str.length-1) do |len|
    current_substring = str[len..str.length]
    all_substrings << substrings_at_start(current_substring)
  end

  all_substrings.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
