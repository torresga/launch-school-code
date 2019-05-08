# Clean up the words
# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# Input: One string consisting of words and assortment of non-alphabetic characters
# Output: One string with all non-alphabetic characters replaced by spaces
# Mental model: Take a string containing words and non-alphabetic characters and return a new string replacing those alphabetic characters with one space per first non-alphabetic characters.

# What about numeric characters? Are those considered non-alphabetic characters?

# Examples:

# cleanup("---what's my +*& line?") == ' what s my line '
# cleanup("where's your #&&$343@$@* homework?") == 'where s your homework '
# cleanup("clean your ******** room!") == 'clean your room '
# cleanup("a$$ hole") == 'a hole'

# Data structures

# Input is a string. We can split the input string into an array to work with it internally. Then we can turn the array into a string and return it.

# Algorithm
# Get input string
# Create counter
# Create a new empty array
# Split string into characters
# Loop over characters
#   If character contains any non-alphabetic characters
#     If previous character is non-alphabetic as well
        # Add empty string to new_array
      # Else
#       Add space to new_array
#     Else
#       Remove characters
# Join words with a space
# Return new string

# Code
def cleanup(str)
  chars = str.chars
  only_letters = []
  counter = 0
  non_alphanumeric = %w(~ ` ! @ # $ % ^ & * - _ + = [ ] { } | \ : ; " ' < , > . ? /)
  non_alphanumeric << " "
  non_alphanumeric << ""

  chars.each do |char|
    if non_alphanumeric.include?(char)
      if counter > 0 && (non_alphanumeric.include?(chars[counter-1]))
        only_letters << ""
      else
        only_letters << " "
      end
    else
      only_letters << char
    end
    counter += 1
  end

  only_letters.join
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("where's your #&&$@$@* homework?") == 'where s your homework '
p cleanup("clean your ******** room!") == 'clean your room '
p cleanup("a$$ hole") == 'a hole'

# Solution
# def cleanup(text)
#   text.gsub(/[^a-z]/i, ' ').squeeze(' ')
# end

# is the same as

# def cleanup(text)
#   text.gsub(/[^a-z]/i, ' ').gsub(/\s+/, ' ')
# end

# Further Exploration
# If you originally wrote this method with regular expressions, try writing it without regular expressions.
# Non regular expression example is above.
