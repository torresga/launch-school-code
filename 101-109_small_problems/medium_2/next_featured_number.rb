# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

# Input: A positive integer greater than 1
# Output: A positive integer greater than 1

#   Return next featured number
#     - odd
#     - multiple of 7
#     - digits occur exactly once each


# Examples:

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Data Structures

# Can create a new array with odd multiples

# Algorithm

# Create a new array with odd multiples of 7 from 1 to featured number
# Remove numbers that don't have unique digits
# Return first number

# Code

def featured(number)
  featured_number = 0
  count = 7

  while number >= featured_number
    if count.digits.uniq == count.digits
      featured_number = count
    end
    count += 14
  end

  featured_number
end

p featured(12) #== 21
p featured(20) #== 21
p featured(21) #== 35
p featured(997) #== 1029
p featured(1029) #== 1043
p featured(999_999) #== 1_023_547
p featured(999_999_987) #== 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
