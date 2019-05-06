# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Input: One string containing at least one character
# Output: Hash - 3 key value pairs.
#   first key - percentage of lowercase letters in input
#   second key - percentage of uppercase letters
#   third key - percentage of characters that are neither (punctuation, spaces, integers)

# What is a percentage? a decimal times 100 where the decimal is:
#   how many characters of type / string's length

# Examples

# letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }

# string length = 10 chars
# downcase = 5
#  5.0 / 10 = 0.5
#  0.5 * 100 = 50

#  upcase = 1
#  1.0 / 10 = 0.1
#  0.1 * 100 = 10

#  neither = 4
#  4.0 / 10 = 0.4
#  0.4 * 100 = 40

# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Data Structures

# input: string - count
# or array to use select

# output is a hash

# Algorithm

# Create a method percentage to calculate percentage - make sure that percentage is returned as an integer

# Count number of downcase letters
# Count number of upcase letters
# Count number of characters that are not upcase or downcase

# Create hash
# Add to hash percentage of lowercase
# Add to hash percentage of uppercase
# Add to hash percentage of neither

# Code

def percentage(count, length)
  percentage = ((count / length.to_f) * 100)
  percentage.round(2)
end

def letter_percentages(str)
  percentages = {
  }

  length = str.length
  lowercase_count = str.count("a-z")
  uppercase_count = str.count("A-Z")
  neither_count = str.length - (lowercase_count + uppercase_count)

  percentages[:lowercase] = percentage(lowercase_count, length)
  percentages[:uppercase] = percentage(uppercase_count, length)
  percentages[:neither] = percentage(neither_count, length)

  percentages
end


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

p letter_percentages('abcdefGHI')

# Further Exploration
# If we passed a string 'abcdefGHI' as an argument to our method call the solution would be {:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0.0}. It would be nicer if we could round these float numbers so that our solution looks like this {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}. Try creating that solution on your own.
