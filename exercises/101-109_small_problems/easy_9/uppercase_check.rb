# Uppercase Check
# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

# Input: A string argument
# Output: A boolean
# Mental model: Given a string, return a boolean depending on whether all of the alphabetic characters are uppercase or lowercase.

# Examples:

# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true

# Data structure

# Input is a string
# Can turn input into an array
# Output is a boolean

# Algorithm

# Split string into an array
# Loop through array
#   If every character is uppercase
#     Return true
#   Else
#     Return false

# Code

def uppercase?(str)
  str.chars.all? {|x| x == x.upcase }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further Exploration
# Food for thought: in our examples, we show that uppercase? should return true if the argument is an empty string. Would it make sense to return false instead? Why or why not?

# I think uppercase?('') should return true since ''.upcase == '' returns true, despite the fact ''.upcase isn't really upcase, since the string is empty.
