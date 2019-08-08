# Pascal's Triangle
#
# Write a program that computes Pascal's triangle up to a given number of rows.
#
# In Pascal's Triangle each number is computed by adding the numbers to the right and left of the current position in the previous row.
#
#     1
#    1 1
#   1 2 1
#  1 3 3 1
# 1 4 6 4 1
# 1 5 10 10 5 1
# ... etc

# class Triangle
 # - Initialize
    # Input: An integer representing the number of rows
    # Assigns an attribute @number_of_rows to contain the number of rows input to the method
    # Assigns an attribute @rows to house an array containing the rows
    # This method is also where we create the rows
 # - Rows
 #   Input: none
 #   Output: A nested array containing the number of rows
 #   An attribute reader for rows

# Last is an array method so we don't have to worry about that one

# Create rows:
# Input: number representing the number of rows to create
# Output: a nested array of the type [[x], [x, x], [x, x, x]] which has a length depending on the input number

# Rules:
  # First array is [1]
  # Second array is [1, 1]
  # Each row is one more than the row before it.

  # I wonder if we can move back and forth.. like to get slices of a string?

  # Algorithm
  # 0. Create new array starting with [[1], [1, 1]]
  # 1. Loop from 3 to number_of_rows times
  # 2.  Create a new inner array
  # 4.  array from 0 - last element length.times |current_number|
   # 3.   Add 1 to inner array if current number is zero
  # 5.  Add to inner array the sum of the slice of outer array from current number, and 2 slices
      # Add inner array to outer array

  class Triangle

    def initialize(number_of_rows)
      @number_of_rows = number_of_rows
      @rows = create_rows
    end

    def rows
      return @rows[0...1] if @number_of_rows == 1
      return @rows[0..2] if @number_of_rows == 2
      @rows
    end

    private

    def create_rows
      rows = [[1], [1, 1]]

      (3..@number_of_rows).each do |row|
        inner_array = []
        rows.last.length.times do |current_number|
          inner_array << 1 if current_number.zero?
          inner_array << rows.last.slice(current_number, 2).sum
        end

        rows << inner_array
      end

      rows
    end
  end
