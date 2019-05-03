# Double Doubles
# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

# Input: An integer
# Output: An integer
# Mental model: Given an integer, return the integer if it has an even number of digits and both sides have the same digits. Otherwise, return 2 times the integer.

# Examples:

# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10
# Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

# Data Structures

# Input is an integer. Output is an integer. Input can be split into an array.

# Algorithm

# Split number into digits
# If number of digits is even
#   Divide number in half
#   Check first digit and half point
#     If those are the same, return number
# Else
#   return number * 2

# Code

def twice(int)
  digits = int.digits.reverse

  if digits.size.even?
    half_point = digits.size / 2

    if digits.first == digits[half_point]
      int
    else
      int * 2
    end
  else
    int * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
