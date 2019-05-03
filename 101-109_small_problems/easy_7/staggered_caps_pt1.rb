# Staggered Caps (Part 1)
# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

# Input: A string
# Output: A new string
# Mental model: Given a string, create a new string that capitalizes every other letter. Leave non-alphanumeric characters in the string but use them to determine which characters get uppercase.

# Example:

# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Data structure
# Input and output are strings. But internal structure can be an array.

# Algorithm
# Create new array for chars
# Downcase the string
# Split string into characters
# Loop through characters
#   If character's index is even?
#       Add to array the upcased character
#   Else
#      Add to array the downcased character

# Return the new joined array

# Code

def staggered_case(str)
  chars = []

  str.downcase.chars.each_with_index do |char, index|
    if index.even?
      chars << char.upcase
    else
      chars << char.downcase
    end
  end

  chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Further Exploration
# Can you modify this method so the caller can request that the first character be downcased rather than upcased? If the first character is downcased, then the second character should be upcased, and so on.

# Hint: Use a keyword argument.

def staggered_case(string, start_case="uppercase")
  result = ''
  need_upper = start_case.include?("up") ? true : false
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

p staggered_case('I Love Launch School!', "lowercase") #== 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
