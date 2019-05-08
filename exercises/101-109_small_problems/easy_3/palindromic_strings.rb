# PEDAC
#
# Goal: Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.
#
# Identify Expected Input or outputs
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Input is a string.
# Output is a boolean
#
# Should we ensure all input is a string by converting it to_s in the method?
# We should NOT remove spaces or special characters.
#
# Create examples/test cases
#
# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true
#
# Data Structures
#
# Input can either remain a string or can be split into an array.
#
# Algorithm
#
# Get reverse of string
# If string is equal to the string's reverse
#   Return true
# else
#   Return false
# End
#
# Code

# Breaking str into an array
# def palindrome?(str)
#   reversed_string = str.chars.reverse.join
#   reversed_string == str
# end

# Reversing a string using an until loop
# def palindrome?(str)
#   chars = str.split("")
#   reversed_string = ""
#   counter = chars.length-1
#
#   until counter < 0
#     reversed_string << chars[counter]
#     counter -= 1
#   end
#
#   reversed_string == str
# end

def palindrome?(str)
  str.reverse == str
end


puts "String palindromes"
puts palindrome?('madam')
puts palindrome?('Madam')
puts palindrome?("madam i'm adam")
puts palindrome?('356653')

# Further Exploration
#
# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.


def array_palindrome?(arr)
  arr == arr.reverse
end

puts "\n"
puts "Array palindromes"
puts array_palindrome?(['m', 'a', 'd', 'a', 'm'])
puts array_palindrome?(['M', 'a', 'd', 'a', 'm'])
puts array_palindrome?(["m", "a", "d", "a", "m", " ", "i", "'", "m", " ", "a", "d", "a", "m"])
puts array_palindrome?(["3", "5", "6", "6", "5", "3"])

# The palindrome? method is true for both arrays and strings. Because #reverse is a method that works on both strings and arrays.

puts "\n"
puts "Both palindromes"
puts palindrome?(['m', 'a', 'd', 'a', 'm'])
puts palindrome?(['M', 'a', 'd', 'a', 'm'])
puts palindrome?(["m", "a", "d", "a", "m", " ", "i", "'", "m", " ", "a", "d", "a", "m"])
puts palindrome?(["3", "5", "6", "6", "5", "3"])
puts palindrome?('madam')
puts palindrome?('Madam')
puts palindrome?("madam i'm adam")
puts palindrome?('356653')
