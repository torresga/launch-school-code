# Get The Middle Character
# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

# Input: Non empty string
# Output: Middle character(s)
# Mental model: Given a non empty string, return the middle character if the string is odd, middle 2 characters if the string is even.

# Examples:

# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'

# Data structures

# Input and output are both strings.

# Algorithm

# Get length of string
# Divide string by 2
# If length is odd
#   Return character at index string / 2
# Else
#   Return character at index string / 2 - 1, character at index string / 2

# Code
def center_of(str)
  len = str.length
  half = len / 2

  return str[half] if len.odd?

  str[half-1] + str[half]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
p center_of("Lunc")
