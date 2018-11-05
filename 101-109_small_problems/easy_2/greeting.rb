# PEDAC
# Goal: Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# Identify expected input or Output
# Make requirements explicit
# Identify rules
# Create a mental model of the problem
#
# Input: A name consisting of a string.
# Output: A greeting consisting of a string.

# Create examples/test cases to validate understanding of problem

# What is your name? Bob
# Hello Bob.
#
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# Data Structures

# Both input and output can be represented by strings.

# Algorithm

# Given a string input.

# Set greeting = ''
#
# Ask for name.
# If name ends with '!'
#   Assign "HELLO" + uppercase name + "WHY ARE WE SCREAMING?" to greeting
# Else
#   Assign "Hello" + name to greeting
# End
#
# Display greeting

# Code - original solution

# print "What is your name? "
# name = gets.chomp
#
# greeting = ''
#
# name[-1] gives the same effect since [-1] starts counting from string backwards
# can also use name.chop to remove the last character in name
# if name[name.length-1] == "!"
#   greeting = "HELLO #{name[0, name.length-1].upcase}. WHY ARE WE SCREAMING?"
# else
#   greeting = "Hello #{name}."
# end
#
# puts greeting

# Further Exploration
# Try modifying our solution to use String#chomp! and String#chop!, respectively.

print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
