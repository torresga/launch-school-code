# PEDAC
# Goal: write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise.
#
# Identify Expected Input or Output
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Input: two boolean arguments
# Output: one boolean
#
# Return true if only one of the arguments is truthy
# Return false in all other cases
#
# What is truthy? An expression (?) that evaulates to true?
# Anything that is not false or nil
#
# Create examples/test cases
#
# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false
#
# this means that the only arguments that are true are these:
#
# xor?(true, false) == true
# xor?(false, true) == true
#
# Data Structures
#
# Input is represented as booleans
# Output is represented as a boolean
#
# Algorithm
#
# If input1 == true and input2 == false
#   Return true
# Else if input1 == false and input2 == true
#   Return true
# Else
#   Return false
#
# Code

# def xor?(bool1, bool2)
#   if bool1 == true && bool2 == false
#     true
#   elsif bool1 == false && bool2 == true
#     true
#   else
#     false
#   end
# end

# Is this the same?
def xor?(bool1, bool2)
  if (bool1 == true && bool2 == false) || (bool1 == false && bool2 == true)
    true
  else
    false
  end
end

puts xor?(5.even?, 4.even?) == true # should be true
puts xor?(5.odd?, 4.odd?) == true # should be true
puts xor?(5.odd?, 4.even?) == false # should be true
puts xor?(5.even?, 4.odd?) == false # should be true

# Further Exploration
# Can you think of a situation in which a boolean xor method would be useful? Suppose you were modeling a light at the top of a flight of stairs wired in such a way that the light can be turned on or off using either the switch at the bottom of the stairs or the switch at the top of the stairs. This is an xor configuration, and it can be modeled in ruby using the xor method. Think of some additional examples.
# Are switches in general examples of xor?
# Or clicking a button on and off - its either on or off (but not both)

#
# || and && are so-called short circuit operators in that the second operand is not evaluated if its value is not needed. Does the xor method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?

# I don't think short-circuit evaluation in xor operations even make sense. || and && are short circuit operators because true || false always evaluates to true, and false && true always evaluates to false. In xor, if the first operand evaluates to true, Ruby will have to evaluate the second operand to ensure it is false (and therefore not true.) If the first operand evaluates to false, Ruby will have to evaluate the second operand to ensure it is true (and therefore not false.)
