# Pythagorean Triplet
#
# A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for which, a**2 + b**2 = c**2.
#
# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.

# - Initialize:
#   Input: Three numbers in an array
#   Output: none
# - Sum
#   Input: None
#   Output: Returns the sum of the three numbers
# - Product
#   Input: None
#   Output: Returns the product of the three numbers
# - pythagorean?
#   Input: None
#   Output: Returns whether the three numbers is a pythagorean triplet (a**2 + b**2 = c**2)
# - class method where:
#   - input: a min and a max factor
#   - a nested array of arrays of three numbers that are pythagorean
#   Algorithm
#   1. Get a nested array of Triplets of three numbers from min to max (can use repeated_combination to_a because numbers don't have to be in order)
#   2. Select arrays that are pythagorean

class Triplet
  attr_reader :factors

  def initialize(*args)
    @factors = args.flatten
  end

  def sum
    factors.sum
  end

  def product
    factors.reduce(:*)
  end

  def pythagorean?
    factors.first**2 + factors[1]**2 == factors.last**2
  end

  def self.where(min_factor: 1, max_factor:, sum: 0)
     all_factors = (min_factor..max_factor).to_a.repeated_combination(3).to_a.map {|arr| Triplet.new(arr) }

    all_factors.select do |each_factor|
      if sum > 0
        each_factor.pythagorean? && each_factor.sum == sum
      else
        each_factor.pythagorean?
      end
    end
  end
end
