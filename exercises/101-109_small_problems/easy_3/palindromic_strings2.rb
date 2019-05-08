# PEDAC
#
# Goal: Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.
#
# Identify Expected Input or outputs
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Input: string
# Output: boolean
#
# Method should be case insensitive
# Ignores all non-alphanumeric characters (so everything that is NOT a number or a letter)
#
#
# Create examples/test cases
#
# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false
#
# Data Structures
#
# Input can either be a string or an array.
# Output will remain a boolean.
#
# Algorithm
#
# Get Input
# Make input lowercase
# Remove from input every character that is not alphanumeric
#
# If input is equal to the input reversed
#   return true
# Else return false
#
# Code

# Palindrome from last session
def palindrome?(input)
  input.reverse == input
end

def real_palindrome?(input)
  # downcased_str, alphanumerics = ""
  # make input lowercase
  # if input is an array? lets join it and make it all downcase
  if input.is_a?(Array)
    downcased_str = input.join.downcase
  else
    downcased_str = input.downcase
  end

  # remove every character that is not alphanumeric
  alphanumerics = downcased_str.gsub(/[^a-zA-Z\d]/, "")

  palindrome?(alphanumerics)
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false
puts real_palindrome?(['m', 'a', 'd', 'a', 'm']) == true
puts real_palindrome?(["M", "a", "d", "a", "m", ",", " ", "I", "'", "m", " ", "A", "d", "a", "m"]) == true
