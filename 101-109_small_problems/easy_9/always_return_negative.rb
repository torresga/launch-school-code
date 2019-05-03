# Always Return Negative
# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

# Input: Integer
# Output: An integer
# Mental model: Given an integer, return a negative number.

# Examples;

# negative(5) == -5
# negative(-3) == -3
# negative(0) == 0      # There's no such thing as -0 in ruby

# Data Structures

# Input and output are integers.

# Algorithm

# If number < 1
#   Return number
# Else
#   return number * -1

# Code

def negative(number)

  return number if number < 1

  number * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0

# Further Exploration
# There is an even shorter way to write this but it isn't as immediately intuitive.

# def negative(number)
#   -number.abs
# end
# This works by flipping the problem on the head. It straightaway converts it to a positive number with Numeric#abs and then prepends it with a negative operator to make it negative. abs returns the absolute value of a number (the non-negative value of a number without regard to its sign).

# So instead of operating by checking the value and proceeding based on the evaluation, the opposite can be applied by stripping it of its sign, then giving it the negative sign.

# This is clearly shorter. However is it superior?
# No. It is confusing. -1.abs converts to positive, but --1.abs converts -1.abs to positive and then makes that negative with the -. Not hard but not immediately intuitive.
