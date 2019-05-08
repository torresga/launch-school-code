# PEDAC
# Goal: Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

# Identify Expected Input or output
# Make requirements explicit
# Identify rules
# Mental models of problem

# Input: two strings
# Output: One string containing: shorter string + longer string + shorter string
# What happens if we have two strings of the same length?
# Let's say that if both strings are the same length, output is string1 + string2 + string1
#
# Create examples/test cases
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"
#
# Data Structures
# For this exercise we could work with strings - both the input strings and a new string created from both input strings.
# We could also use an array to store the strings and join them together.
#
# Algorithm
# Get string1
# Get string2
#
# Calculate which one is longest
# If string1 is longest
#   Assign string1 as longest
    # Assign string2 as shortest
# Else if string2 is longest
#   Assign string2 as longest
    # Assign string1 as shortest
#
# Return shorter string + longer string + shorter string
#
# Code
def short_long_short(string1, string2)
  longest = ''
  shortest = ''
  if string2.length > string1.length
    longest = string2
    shortest = string1
  else
    longest = string1
    shortest = string2
  end
  "#{shortest}#{longest}#{shortest}"
end

# With array
# def short_long_short(string1, string2)
#   strings = [string1, string2]
#   can also use strings.sort_by!(&:size)
#   strings.sort_by! {|elem| elem.length}
#   strings.first + strings.last + strings.first
# end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
puts short_long_short('abc', 'abc') == "abcabcabc"
