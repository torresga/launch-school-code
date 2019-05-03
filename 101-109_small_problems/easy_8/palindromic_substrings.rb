# Palindromic Substrings
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# Input: A string
# Output: An array of palindromes
# Mental model: Given a string, return a list of all substrings greater than 1 that are palindromic.

# Examples:

# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# Data Structures
# Input is a string. Output is an array.

# Algorithm
# Get a list of substrings
# Return substrings that are longer than 1 character and are the same forwards and backwards

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

def palindromes(str)
  palindromes = substrings(str)

  palindromes.select do |word|
    word = word.downcase.gsub(/[^a-z]/i, "")
    word.length > 1 && word == word.reverse
  end
end

p palindromes('abcd') #== []
p palindromes('madam') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')
p palindromes("Abcba") # ['Abcba', 'bcb']
p palindromes("AbcbA") # ['AbcbA', 'bcb'
p palindromes("Abc-bA") # ['Abc-bA', 'bc-b']

# Further Exploration
# Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.
