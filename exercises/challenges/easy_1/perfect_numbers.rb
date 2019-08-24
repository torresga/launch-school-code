# Perfect Number
#
# The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient. A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself. This sum is known as the Aliquot sum.
#
#     Perfect: Sum of factors = number
#     Abundant: Sum of factors > number
#     Deficient: Sum of factors < number
#
# Examples:
#
#     6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
#     28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
#     Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
#
# Write a program that can tell if a number is perfect, abundant or deficient.

# One class method, classify
#   Input: Number to classify
#   Output: A string representing whether the number is deficient, abundant, or perfect depending on the input number

# Algorithm
# raise RuntimeError if number < 0
# Get factors of input number
# Remove input number from list of factors
# Add sum of factors
# If sum of factors == number
#   return "perfect"
# else if sum of factors > number
#   return "abundant"
# else
#   return "deficient"

# Getting factors of input number:
#
# Create array called factors
# Loop from 1 to number |current_number|
#   add current number to factors if number % current_number == 0 and number doesn't equal current_number

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0

    sum_of_factors = factors(number).sum

    if sum_of_factors == number
      "perfect"
    elsif sum_of_factors > number
      "abundant"
    else
      "deficient"
    end
  end

  private

  def self.factors(number)
    (1..number).each_with_object([]) do |current_number, arr|
      arr << current_number if number % current_number == 0 && number != current_number
    end
  end
end
