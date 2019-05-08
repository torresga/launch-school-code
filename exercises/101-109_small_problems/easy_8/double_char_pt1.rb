# Double Char (Part 1)
# Write a method that takes a string, and returns a new string in which every character is doubled.

# Input: A string
# Output: A new string in which every character is doubled
# Mental models: Given a string, create a new string that has double each character and return it.

# Examples:

# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

# Data Structures

# Input and output are both strings.

# Algorithm
# Create new string
# Loop through each character of the input string.
#   Add 2 of the current character to the new string

# Return new string

# Code

def repeater(str)
  repeated_str = ''

  str.each_char do |char|
    repeated_str << char * 2
  end

  repeated_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
