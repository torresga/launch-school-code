# PEDAC
# Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method return true if the number's absolute value is odd.
# You may assume that the argument is a valid integer value.

# Identify Expected Input and Output
# Input: one integer argument, which is positive, negative, or zero.
# Output: one boolean

# Make requirements explicit
# Do not use odd? or even? in the solution.
# Can assume is a valid integer, don't worry about floats or non-numeric characters

# Identify rules
# Absolute values are always positive, and sign doesn't change whether a number is even or odd.
# But we can make the number positive by multiplying a negative number times -1.
# That result will be the same as the absolute value of a number.
# Finding the absolute value of the number is important because the remainder is going to be positive or negative depending on the numbers inputted and depending on what operator (modulus or the remainder function) is used. And if the remainder is -1, the condition below will fail even if the number is odd.

# Test cases
# puts is_odd?(2)    => false
# puts is_odd?(5)    => true
# puts is_odd?(-17)  => true
# puts is_odd?(-8)   => false
# puts is_odd?(0)    => false
# puts is_odd?(7)    => true

# Data structures
# Input will be represented by an Integer type.
# Output will be represented by a Boolean type.

# Algorithm
#
# Given an integer
# SET number = integer
#
# IF number is negative
#  number = number times -1
#
# IF number % 2 == 1
#   SET bool = true
# ELSE
#  SET bool = false
#
# PRINT bool
# END

def is_odd?(number)
  if number.negative?
    number = number * -1
  end

  bool = if number % 2 == 1
          true
         else
          false
         end

  bool
end

puts is_odd?(2)    #=> false
puts is_odd?(5)    #=> true
puts is_odd?(-17)  #=> true
puts is_odd?(-8)   #=> false
puts is_odd?(0)    #=> false
puts is_odd?(7)    #=> true

def is_odd_remainder?(number)
  # % and Integer#remainder do not work the same: while -5 % 2 evaluates to 1, -5.remainder(2) equals -1. So if we don't convert all numbers to their absolute value (make them positive by multiplying them by -1,) we have to check that the remainder isn't -1 as well.
  number.remainder(2) == 1 || number.remainder(2) == -1
end

puts "\n"
puts is_odd_remainder?(2)    #=> false
puts is_odd_remainder?(5)    #=> true
puts is_odd_remainder?(-17)  #=> true
puts is_odd_remainder?(-8)   #=> false
puts is_odd_remainder?(0)    #=> false
puts is_odd_remainder?(7)    #=> true
