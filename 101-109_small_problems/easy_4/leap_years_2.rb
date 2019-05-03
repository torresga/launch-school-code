# PEDAC
# Goal: A continuation of the previous exercise.

# The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.
#
# Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

# Identify Expected Input or output
# Make requirements explicit
# Identify rules
# Mental models of problem

# To rewrite leap year rule: a leap year is a year that is divisible by 4. If the year is after 1752, it also has to be divisible by 100 and 400 to be a leap year.

# Input: an integer greater than 0
# Output: a boolean
#
#
# Create examples/test cases

# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == true
# leap_year?(1) == false
# leap_year?(100) == true
# leap_year?(400) == true

#
# Data Structures

# Since we are checking year to determine whether it can be divided evenly, we can keep it as an integer.

# Algorithm

# If year is less than 1752
#   If year is divided by 4
#     Return true
#   Else
#     Return false
# Else
#   If year is greater than 1752
#     If year is divided by 4 and 100 and 400 evenly
#       Return true
#     Else if year is divided by 4 and year does not divide with 100
#       Return true
#   Else
#     Return false

# Code

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
