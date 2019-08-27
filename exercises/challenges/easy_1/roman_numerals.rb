# Roman Numerals
#
# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.
#
# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).
#
#  1  => I
# 10  => X
#  7  => VII
#
# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)
#
# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.
#
# To see this in practice, consider the example of 1990. In Roman numerals 1990 is MCMXC:
#
# 1000=M
# 900=CM
# 90=XC
#
# 2008 is written as MMVIII:
#
# 2000=MM
# 8=VIII

# One method: to_roman called on.. an integer?
#
# For now, let's monkey patch Integer class to include a to_roman method that returns a new string

# I - 1
# IV - 4
# V - 5
# IX - 9
# X - 10
# XL = 40
# L - 50
# XC - 90
# C - 100
# CD - 400
# D - 500
# CM - 900
# M - 1000

# Edge cases:
# anything that starts with a 4 or a 9

# Non brute force algorithm:
# Create a hash of roman_numerals
# Split number into an array
# Map array to numbers ending in zero - first element is length zeroes, last element is no zeroes
# Loop through array
#   Map number to element in Hash
#   If number is not in hash
#     If number's first digit is (1..3)
#     If number's first digit is (6..8)

# Algorithm
# 1. Split integer into digits - self.digits.reverse
# 3. Loop through each digit
#     Next if digit is 0
#     If digits slice length is 4 and digit is 1
#       Map digit to 'M'
#     If digits slice length is 3 and digit is 9
#       Map digit to 'CM'
#     If digits slice length is 3 and digit is 5
#       Map digit to 'D'
#     If digits slice length is 3 and digit is 4
#       Map digit to 'CD'
#     If digits slice length is 3 and digit is 1
#       Map digit to 'C'
#     If digits slice length is 2 and digit is 9
#       Map digit to 'XC'
#     If digits slice length is 2 and digit is 5
#       Map digit to 'L'
#     If digits slice length is 2 and digit is 4
#       Map digit to 'XL'
#     If digits slice length is 2 and digit is 1
#       Map digit to 'X'
#     If digits slice length is 1
        # If digit is 9
#           Map digit to 'IX'
#       If digit is 5
#          Map digit to 'V'
#       If digit is 4
#         Map digit to 'IV'
#       If digit is less than 4
#         Map digit to "I" * digit
#       If digit is greater than 5 and less than 9
#         'V' + 'I' * (digit - 5)
# 4. Return joined array



class Integer
  def to_roman
    digits = self.digits.reverse

    digits.map.with_index do |digit, index|
      if digit == 0
        ''
      elsif digits[index..-1].length == 4
        'M' * digit
      elsif digits[index..-1].length == 3
        if digit == 9
          'CM'
        elsif digit == 5
          'D'
        elsif digit == 4
          'CD'
        elsif digit < 4
          'C' * digit
        elsif digit > 5 && digit < 9
          'D' + 'C' * (digit - 5)
        end
      elsif digits[index..-1].length == 2
        if digit == 9
          'XC'
        elsif digit == 5
          'L'
        elsif digit == 4
          'XL'
        elsif digit < 4
          'X' * digit
        elsif digit > 5 && digit < 9
          'L' + 'X' * (digit - 5)
        end
      elsif digits[index..-1].length == 1
        if digit == 9
          'IX'
        elsif digit == 5
          'V'
        elsif digit == 4
          'IV'
        elsif digit < 4
          'I' * digit
        elsif digit > 5 && digit < 9
          'V' + 'I' * (digit - 5)
        end
      end
    end.join
  end
end
