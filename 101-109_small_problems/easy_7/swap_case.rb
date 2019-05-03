# Swap Case
# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# Input: A string
# Output: A new string
# Mental model: Given a string, return a new string in which each letter has its' case swapped. Don't change any other characters.

# Example:

# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Data structure
# Input and output can be strings.

# Algorithm
# Split the string into characters
# Loop over the characters
#   If character is uppercase
#     make character lowercase
#   Else
#     make character uppercase

# Code

def swapcase(str)
  swapped_case = str.chars.map do |char|
    char == char.upcase ? char.downcase : char.upcase
  end

  swapped_case.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
