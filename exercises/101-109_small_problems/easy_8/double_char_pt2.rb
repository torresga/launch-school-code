# Double Char (Part 2)
# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

# Input: A string
# Output: A new string with every consonant is doubled
# Mental model: Given a string, return a string with every consonant doubled.

# Examples:

# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""

# Data structures
# Input and output are both strings.

# Algorithm
# Create new string.
# Loop over each character in string
# Add character * 2 if character is a consonant

# Return new string.

# Code

def double_consonants(str)
  consonants = ('a'..'z').to_a - ["a", "e", "i", "o", "u"]
  doubled = ''

  str.each_char do |char|
    if consonants.include?(char.downcase)
      doubled << char * 2
    else
      doubled << char
    end
  end

  doubled
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
