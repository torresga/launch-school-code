# PEDAC

# Goal: Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.


# Identify Expected Input or Output
# Make requirements explicit
# Identify rules
# Mental models of problem

# This problem is similar to palindromatic strings, except we are using integers.
#
# Create examples/test cases
#
# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

# Data Structures

# Input is an integer.
# Output is a boolean
#
# We can convert input to a string or an array to use either class's #reverse method.
#
# Algorithm

# Get Input
# Turn input into a string
#
# Check if the string is the same backwards and forwards
# if true
#   return true
# else
#   return false
#
# Code

def palindromic_number?(number)
  number_as_string = number.to_s
  number_as_string == number_as_string.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true

# Further Exploration
# Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?
# 001.to_s => "1"
# 01.to_s => "1"
# I don't see a way to address it while using an integer because of how Ruby represents integers internally.
# Numbers starting with zero in Ruby are octals.
# In order to use numbers that start with zero, you would have to convert the number to a string using the % method or Kernel.sprintf # does this stand for string print format?
# sprintf("0%o", 01) where "0" is the number you want to start with, % starts format sequence, o stands for octal (if you use b or d, it will change the number to its' binary or decimal formats respectively)
# However, the above only works for numbers that have 1 zero in front. I do not know how to generalize it for * zeroes.
# Update: something like sprintf("#{'0' * 2 }%o", 01010) works but I still don't know how to find out how many leading zeroes a number has without Ruby turning it into decimal.
