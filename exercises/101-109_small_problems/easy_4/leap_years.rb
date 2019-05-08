# PEDAC
# Goal: Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

# Identify Expected Input or output
# Make requirements explicit
# Identify rules
# Mental models of problem

# To rewrite leap year rule: a leap year is a year that is divisible by 4. If the year is also divisible by 100, it also has to be divisible by 400 to be a leap year.

# So is it also good to say that a leap year is either divisible by 400 or 4 and not 100?

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
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true
#
# Data Structures

# Since we are checking year to determine whether it can be divided evenly, we can keep it as an integer.

# Algorithm

# If year is divided by 4 and 100 and 400 evenly
#    Then return true
#   Else if just year is divided by 4 evenly and year does not divide evenly with 100
#     return true
# Else return false

# Code

# def leap_year?(year)
#   if (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
#     true
#   elsif (year % 4 == 0) && !(year % 100 == 0)
#     true
#   else
#     false
#   end
# end

# Further Exploration
# The order in which you perform tests for a leap year calculation is important. For what years will leap_year? fail if you rewrite it as:
#
# def leap_year?(year)
#   if year % 100 == 0
#     false
#   elsif year % 400 == 0
#     true
#   else
#     year % 4 == 0
#   end
# end
# leap_year? will fail for 2000, 2400, 240000, and 400

# Can you rewrite leap_year? to perform its tests in the opposite order of the above solution? That is, test whether the year is divisible by 4 first, then, if necessary, test whether it is divisible by 100, and finally, if necessary, test whether it is divisible by 400. Is this solution simpler or more complex than the original solution?

# If I switch the tests:
# def leap_year?(year)
#   if year % 4 == 0
#      true
#    elsif year % 100 == 0
#      false
#    else
#      year % 400 == 0
#    end
#  end
# 2100 will be false
# 1900 will be false
# 1700 will be false
# 100 will be false
# dividing by 4 first will reveal false positives. have to do a nested if statement to make sure that we test for both divisible by 4 and divisible by 100 and divisible by 400
# This has the same effect as my original solution:
def leap_year?(year)
  if year % 4 == 0
     if year % 100 == 0
       if year % 400 == 0
         true
       else
         false
      end
    else
      true
    end
   else
     year % 400 == 0
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
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
