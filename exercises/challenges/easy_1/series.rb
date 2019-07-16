# Series
#
# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.
#
# For example, the string "01234" has the following 3-digit series:
#
# - 012
# - 123
# - 234
#
# And the following 4-digit series:
#
# - 0123
# - 1234
#
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

# Initialize:
# Input: A string
#
# Input: A string
# Output: An array of arrays of length size - [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
# Problem: Loop through the array and return a nested array of arrays of size series.

# Algorithm
# Create a new array
# Loop through array
#   Slice size elements from current number
#   Add to new array if slice's size == size
#
# Return array

class Series
  def initialize(str)
    # We create a new series with a string argument
    @series = str.split("").map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if size > @series.size
    # Returns a nested array, an array of arrays of length size

    series = []

    @series.each_with_index do |_, index|
      slice = @series.slice(index, size)
      series << slice if slice.size == size
    end

    series
  end
end
