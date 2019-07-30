# Trinary
#
# Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).
#
# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.
#
# The last place in a trinary number is the 1's place. The second to last is the 3's place, the third to last is the 9's place, etc.
#
# # "102012"
#     1       0       2       0       1       2    # the number
# 1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2 =  302

# Input: A string representing a number in trinary
# Output: A number in decimal

# Number is zero if the input contains any numbers other than 0, 1, or 2.

# Algorithm
# 1. Convert input string to number - 0 if number string contains any numbers other than 0, 1, or 2, otherwise the number as an integer
# 2. Flip number around
# 3. Split number into digits
# 4. Loop through number with index
# 5.   Transform number into the product: number * (3 ** current index)
# 6. Add sums together
# 7. return sum

class Trinary
  def initialize(value)
    @value = value.match?(/[^012]/) ? 0 : value.to_i
  end

  # In here we have to check if number only contains 0 1 and 2.
  def to_decimal
    @value.digits.map.with_index do |current, index|
      current * (3 ** index)
    end.sum
  end
end
