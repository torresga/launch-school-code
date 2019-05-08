# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# Input: An array of integers from 0 to 19
# Output: An array of sorted integers
# Mental model: Given an array of integers from 0 to 19, return a new array of those integers sorted by their english words.

# Examples:

# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# Data structures
# Input and Output can be an array. Create a new hash with numbers as keys and english numbers as values to sort by.

# Algorithm
# Create a new hash with numbers as keys and english numbers as values.
# Loop through the array
#   Sort each number by english number value

# Code
INTS_TO_ENGLISH = {0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve", 13=>"thirteen", 14=>"fourteen", 15=>"fifteen", 16=>"sixteen", 17=>"seventeen", 18=>"eighteen", 19=>"nineteen"}

def alphabetic_number_sort(numbers)
  numbers.sort_by {|num| INTS_TO_ENGLISH[num] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# We can also use an array since the elements in array are the same position as their indices.
# NUMBER_WORDS = %w(zero one two three four
#                   five six seven eight nine
#                   ten eleven twelve thirteen fourteen
#                   fifteen sixteen seventeen eighteen nineteen)
# And then call sort_by usiing the index to get the value at NUMBER_WORDS[idx].

# Further Exploration
# Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?
# Because we didn't want to mutate the array sort_by! was called on.

# For an extra challenge, rewrite your method to use Enumerable#sort (unless you already did so).
def alphabetic_number_sort(numbers)
  numbers.sort {|a, b| INTS_TO_ENGLISH[a] <=> INTS_TO_ENGLISH[b]}
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
