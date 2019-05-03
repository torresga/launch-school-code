# Delete vowels
# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# Input: An array of strings
# Output: An array of strings
# Mental model of problem: Given an array of strings, create a new array containing the same strings with the vowels removed.

# Example:

# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Data Structures

# Input and output are both arrays.

# Algorithms

# Get input array
# Create new array without_vowels
# Loop through input array
#   Remove vowels from current element
#   Add current element to without_vowels

# Return without_vowels

# Code
def remove_vowels(ary)
 without_vowels = []

 ary.each do |word|
   without_vowels << word.gsub(/[aeiou]/i, "")
 end

 without_vowels
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Further Exploration
# Ruby has all sorts of String methods that could accomplish this task. How did you end up solving this exercise?
