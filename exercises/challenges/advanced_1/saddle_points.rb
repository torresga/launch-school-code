# Saddle Point
#
# Write a program that detects saddle points in a matrix.
#
# So say you have a matrix like so:
#
#     0  1  2
#   |---------
# 0 | 9  8  7
# 1 | 5  3  2     <--- saddle point at (1,0)
# 2 | 6  6  7
#
# It has a saddle point at (1, 0).
#
# It's called a "saddle point" because it is greater than or equal to every element in its row and the less than or equal to every element in its column.
#
# A matrix may have zero or more saddle points.
#
# Your code should be able to provide the (possibly empty) list of all the saddle points for any given matrix.
#
# Note that you may find other definitions of matrix saddle points online, but the tests for this exercise follow the above unambiguous definition.

# Saddle point:
# >= to every element in row (horizontally)
# <= to every element in column (vertically)
#
# class Matrix
#   - initialize
#     Input: A string separated by \ns
#     Output: none
#     Initialize @rows
#     Initialize @columns
#   - rows
#     Attr_reader for @rows
#   - columns
#     Attr_reader for @columns
#   - saddle_points
#     Input: none
#     Output: a new nested array containing the coordinates of saddle points for the matrix

# private methods:
#   - get rows:
#     Input: A string
#     Output: A nested array.
#     Algorithm:
#       Split string by "\n"
#       Transform each element of array:
#         Split string on whitespace
#         Map resulting array and transform each element to_s
#     Return transformed array
  # - get columns:
  #   input: a nested array of rows
  #   output: a nested array of columns, so each inner array contains element from the input array with the same index
  # Algorithm
  # Create a new array 'columns'
  # Loop over each row
  #   Create new inner row array 'inner_column'
  #   Loop through inner_row
  #     Get outer index element of each row
  #    Add outer index element to columns
  # Add inner_column to columns
  # Return columns

class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_str)
    @rows = get_rows(matrix_str)
    @columns = get_columns
  end

  def saddle_points
  end

  private

  def get_rows(matrix_str)
    matrix_str.split("\n").map do |row|
      row.split(" ").map(&:to_i)
    end
  end

  def get_columns
    columns = []
    max_number = [rows.length, rows.first.length].max

    max_number.times do |time|
      current_column = []

      rows.each do |row|
        current_column << row[time]
      end

      columns << current_column
    end

    columns
  end
end

# Saddle point:
# >= to every element in row (horizontally)
# <= to every element in column (vertically)
# Algorithm
# Loop through rows
# Loop through columns
#   Select the array in rows that is the max
#   Select the array in columns that is the min
# Find out which element is in both
# Select row that has the same element

matrix = Matrix.new("1 2\n3 4")
p matrix.rows
p matrix.columns
p matrix.saddle_points #[[0, 1]]

matrix = Matrix.new("18 3 39 19 91\n38 10 8 77 320\n3 4 8 6 7")
p matrix.rows
p matrix.columns
p matrix.saddle_points #assert_equal [[2, 2]], matrix.saddle_points

matrix = Matrix.new("4 5 4\n3 5 5\n1 5 4")
p matrix.rows
p matrix.columns
p matrix.saddle_points # assert_equal [[0, 1], [1, 1], [2, 1]], matrix.saddle_points

matrix = Matrix.new("9 8 7\n5 3 2\n6 6 7")
p matrix.rows
p matrix.columns
p matrix.saddle_points
# p matrix.rows[1][0]
