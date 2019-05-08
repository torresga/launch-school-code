# PEDAC

# Identify expected input or output
# Input: a string, a positive integer
# Output: string printed integer times

# Make requirements explicit
# 1. There has to be two arguments.
#  What if there are less than two arguments? Break and prompt user to enter two arguments.
# 2. First argument must be a string.
#  What if first argument is not a string? Break and prompt user to enter a string.
# 3. Second argument must be an integer greater or equal to one.
#  What if second argument is zero or a negative integer? Break and prompt user to enter an integer greater or equal to one.
#  What if second argument is a float? Drop the fractional part.
# 4. Each output is on a separate line.

# Examples/ Test Cases
# repeat('Hello', 3) -> Hello
#                       Hello
#                       Hello
# repeat('The Quick Brown Fox Jumped Over the Lazy Dog', 0) -> Please enter an integer greater or equal to one.
# repeat('3', 3) -> 3
#                   3
#                   3
# repeat('3', -3) -> Please enter an integer greater or equal to one.
# repeat('Good morning', 2.5) -> Good morning
#                                Good morning

# Data Structures
# Input: string and number will be represented by their respective data types
# Output: output will be represented as a string

# Algorithm
# Check if str is a string
#   If str is not a string or if str is nil
#     Break and prompt user to enter a string
# Check if number is a positive integer
#   If num < 1 or if num is nil
#     Break and prompt user to enter an number greater or equal to one
#   Else if num is a float
#     Assign to num the number minus the fraction
# For num of times
#   print string on new line

# Code
def repeat(str, num)
  if str.is_a?(String) == false || str.nil?
    puts "Invalid input. Please enter a string."
    return
  end

  if num < 1 || num.nil?
    puts "Invalid input. Please enter a number greater or equal to one."
    return
  elsif num.is_a?(Float)
    num = num.to_i
  end

  num.times { puts str }
end

repeat('Hello', 3)
repeat('The Quick Brown Fox Jumped Over the Lazy Dog', 0)
repeat('3', 3)
repeat('3', -3)
repeat('Good morning', 2.5)
