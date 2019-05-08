# PEDAC
# Goal: Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).
#
# Identify Expected input or Output
# Input: One argument
# Output: One argument
# Make requirements explicit
# Identify rules
# Mental Models of problem
# Our example only covers if we input an integer. But what do we do with strings?
# The "*" implemented for strings only takes an integer for an argument. This means "2" * "2" would cause a TypeError.
# This problem can be avoided by making sure all arguments passed into the square method are of some numeric type.
#
# Create Examples/test cases to validate understanding of problem
# square(5) == 25
# square(-8) == 64
#
# Data Structures

# Or what we can do is internally represent numbers as a float, and then drop the fraction if the fractional part is zero.
#
# Algorithm

# Get input
# Multiply input times input
# Return result

#
# Code

def multiply(first, second)
  first * second
end

def square(number)
  multiply(number, number)
end

def has_fraction?(number)
  fraction = number.to_s.split(".").last.to_i

  if fraction > 0
    true
  else
    false
  end
end

puts "What number would you like to square?"
number = gets.to_f

squared_number = square(number)

if has_fraction?(squared_number)
  puts "#{squared_number}"
else
  puts "#{squared_number.to_i}"
end

# Further Exploration
# What if we wanted generalize this method to a "power to the n" type method: cubed, to the 4th power, to the 5th, etc. How would we go about doing so while still using the multiply method?

def power(base, exponent)
  total = 1

  # we don't actually need this
  # if exponent == 1
  #   total = base
  # elsif exponent == 0
  #   total = 1
  # end
  # But what if the exponent were negative?

  (exponent.abs).times do
    total = multiply(total, base)
  end

  if exponent < 0
    total = (1.0 / total).to_r
  end

  total
end

puts power(2, 2) == 2**2
puts power(2, 4) == 2**4
puts power(2, 5) == 2**5
puts power(2, -4) == 2**-4
