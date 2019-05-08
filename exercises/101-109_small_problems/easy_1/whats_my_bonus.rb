# PEDAC
# Goal: Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

# Identify Expected Input or output
# Make requirements explicit
# Identify rules
# Create mental models of problem
# Expected input: A positive integer and a boolean
# Expected output: A positive integer greater or equal to zero.
# Rules: If boolean is true, return first argument / 2,
# Else if boolean is false, return 0

# Create Examples/Test cases to validate understanding of problem
# puts calculate_bonus(2800, true) => 1400
# puts calculate_bonus(1000, false) => 0
# puts calculate_bonus(50000, true) => 25000

# Data structures
# Input -> Integer and Boolean
# Output -> Integer

# Algorithm
# Given a positive integer and a boolean.
# Set bonus = 0
# If boolean == true
#   Assign the result of positive integer / 2 to bonus
# Else
#   Assign 0 to bonus
# End
#
# Return bonus

# Code
def calculate_bonus(salary, gets_bonus)
  bonus = 0

  # Could also be:
  # gets_bonus == true ? salary / 2 : 0
  # LS solution shows that we don't even need gets_bonus == true, it can just be gets_bonus ? (salary / 2) : 0
  if gets_bonus == true
    bonus = salary / 2
  else
    bonus = 0
  end

  bonus
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
