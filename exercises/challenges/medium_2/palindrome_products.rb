# Palindrome Products
#
# Write a program that can detect palindrome products in a given range.
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.

# palindromes = Palindromes.new(max_factor: 9)
# palindromes.generate
# largest = palindromes.largest
# assert_equal 9, largest.value

# assert_includes [[[3, 3], [1, 9]], [[1, 9], [3, 3]]], largest.factors - THIS MEANS THAT THE FACTORS CAN APPEAR IN ANY ORDER
#
# palindromes = Palindromes.new(max_factor: 99, min_factor: 10)
# palindromes.generate
# largest = palindromes.largest
# assert_equal 9009, largest.value
# assert_equal [[91, 99]], largest.factors
#
# Palindromes:
# - initialize
#   - Input: min_factor and/or max_factor
#     If no min_factor, then it's 1
# - generate
#   - Input: none
#   - Output: a list of palindromes - a nested array of Palindromes (so create a new class)
    # - Generate a combination of numbers:
    #   - Add products together to get [number 1, number 2]
    #   - Loop through array
    #   - Multiply first and last of each array together
    #   - Select numbers that are the same backwards and forward
    # - Loop through numbers
    # - Create a new palindrome
    # - Return an array of palindromes
# - largest
#   - Input: None
#   - Output: largest palindrome (represented as an array)
# - smallest
#   - Input: none
#   - Output: smallest palindrome (represented by an array)

# How to determine whether a number is a palindrome?
# number.to_s == number.to_s.reverse

# We need two classes:
# Palindromes, and class for individual palindrome

# class Palindrome:
#   initialize:
#     has an instance variable @value
#   value
#     an attribute reader
#  factors
      # returns the factors of a palindrome

class Palindrome
  attr_reader :factors
  attr_reader :value

  def initialize(factors)
    @factors = factors
    @value = factors.first.reduce(:*)
  end

  def <=>(other)
    @value <=> other.value
  end
end

class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    # I could have used a hash here instead of two arrays.
    # {
      # 1: [[1, 1]],
      # 2: [[1, 2]],
      # 4: [[1, 4], [2, 2]],
      # ...
    # }
    all_factors =  (@min_factor..@max_factor).to_a.repeated_combination(2)
                              .to_a
                              .select { |x| x.reduce(:*).to_s == x.reduce(:*).to_s.reverse }
                              .uniq
                              .sort_by { |x| x.reduce(:*) }

    all_palindromes = all_factors.map { |x| x.reduce(:*) }

    @palindromes = all_factors.map.with_index do |factors, index|
      all_factors.select { |x| x.reduce(:*) == all_palindromes[index] }
    end.uniq.map do |factors|
      Palindrome.new(factors)
    end
  end

  def largest
    @palindromes.max
  end

  def smallest
    @palindromes.min
  end
end
