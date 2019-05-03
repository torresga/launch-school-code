# Name Swapping
# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

# Input: A string representing a name
# Output: A string
# Mental model: Given a name, return a new string that reverses the last and first names.

# Examples

# swap_name('Joe Roberts') == 'Roberts, Joe'

# Data Structure

# Input and output are both strings.

# Algorithm

# Split string into array.
# Reverse elements array.
# Join array with ","

# Code

def swap_name(name)
  name.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
