# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# Input: One string
# Output: A hash with three keys: lowercase, uppercase, and neither.
# Mental models: Given a string, create a hash that contains three keys: lowercase, uppercase, and neither. For each character in the string, determine if the character is lowercase, uppercase, or neither and add +1 to the value.

# Examples

# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data structure
# Input is string. Output is a hash. Inside our method we can either transform input into an array so we can iterate over it, or use the #each_char method on string.

# Algorithm
# Create an array with the lowercase alphabet
# Create a hash with three keys - lowercase, uppercase, and neither.
# Loop through each character of the string
#   If the downcased character is in alphabet
#     If downcased character == character
#       add 1 to lowercase
#     Else
#       add 1 to uppercase
#   Else
#     add 1 to neither

# Return hash

# Code

def letter_case_count(str)
  alphabet = ('a'..'z').to_a

  count = {
    uppercase: 0,
    lowercase: 0,
    neither: 0
  }

  str.each_char do |char|
    if alphabet.include?(char.downcase)
      if char.downcase == char
        count[:lowercase] += 1
      else
        count[:uppercase] += 1
      end
    else
      count[:neither] += 1
    end
  end
  count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
