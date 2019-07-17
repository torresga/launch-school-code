# Sum of Multiples
#
# Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.
#
# If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.
#
# Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

# Input: One or more integers. If no input, assume 3 and 5. A number argument inside the to method represents the "stop".
# Output: A sum of all the multiples for each number up to but not including the number.
# What happens when we have duplicate multiples? It looks like each multiple is counted only once.

# Algorithm
# 1. Put input numbers into an array.
# 2. Loop over the array.
# 3. Transform each element in the array into an array of multiples up to but not including the "stop" value.
# 4. Flatten array.
# 5. Remove duplicates.
# 6. Return sum of array.

# 3. Multiples:
# Input: A number, a "stop" value
# Output: An array of multiples for that number

# Algorithm
# 1. Get a range - 1 to excluding stop.
# 2. Loop over the range.
# 3. Select The numbers that are multiples of current number.

# def multiples(number, stop)
#   (1...stop).select do |current_number|
#     current_number % number == 0
#   end
# end
#
# p multiples(3, 20)
# p multiples(5, 20)
#
# def sum_of_multiples(*values, stop)
#   arr = *values
#   arr.map do |current_number|
#     multiples(current_number, stop)
#   end.flatten.uniq.sum
# end
#
# p sum_of_multiples(3, 5, 20)

class SumOfMultiples
  @@numbers = [3, 5]

  def initialize(*numbers)
    @numbers = *numbers
  end

  def self.to(stop_value, numbers=@@numbers)
    @@stop_value = stop_value

    numbers.map do |current_number|
      multiples(current_number)
    end.flatten.uniq.sum
  end

  def to(stop_value)
    self.class.to(stop_value, @numbers)
  end

  private

  def self.multiples(number)
    (1...@@stop_value).select do |current_number|
      current_number % number == 0
    end
  end
end
