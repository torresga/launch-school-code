# Rotating Matrices
# As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

# 1  5  8
# 4  7  2
# 3  9  6
# can be described by the Array of Arrays:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

# 3  4  1
# 9  7  5
# 6  2  8
# A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

# 3  4  1
# 9  7  5
# is:

# 9  3
# 7  4
# 5  1
# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

# Input: One matrix of arbitrary length and width.
# Output: One new matrix, "rotated 90 degrees". This means, that an array of rows x and columns y, will be of rows y and columns x.

# 1, 4, 3, have the same column 0 - they are all moved to the first row
# matrix[0][0] is 1
# matrix[1][0] is 4
# matrix[2][0] is 3

# new_matrix[0][0] is 3
# new_matrix[0][1] is 4
# new_matrix[0][2] is 1

# matrix[0][1] is 5
# matrix[1][1] is 7
# matrix[2][1] is 9

# new_matrix[1][0] is 9
# new_matrix[1][1] is 7
# new_matrix[1][2] is 5

# matrix[0][2] is 8
# matrix[1][2] is 2
# matrix[2][2] is 6

# new_matrix[2][0] is 6
# new_matrix[2][1] is 2
# new_matrix[2][2] is 8


# Two operations:
# Getting elements that have the same last index (column) into an array
# Adding that array to a new nested array
# Reversing the array

# How do we get elements that have the same last index into an array?
#   Create combinations of indexes

# Algorithm

# Create a range (0..x)
# Create a range (0..y)
#   Loop over the range
#   Add to new array [current_y, current_x]

# Get an array of combinations
# Loop over each combination
#   Get element for each pair of coordinates
# Reverse elements

def combinations(matrix)
  (0...matrix.max.length).map do |row|
    (0...matrix.length).map do |column|
      [column, row]
    end
  end
end

def rotate90(matrix)
  combos = combinations(matrix)
  combos.map do |combo|
    combo.map do |coords|
      matrix[coords.first][coords.last]
    end.reverse
  end
end

# Examples

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# 3 rows
# 2 columns

# rows should be first
#   columns should be second

p combinations(matrix1)
p combinations(matrix2) #[[[0, 0], [1, 0]], [[0, 1], [1, 1]], [[0, 2], [1, 2]], [[0, 3], [1, 3]]]

# p combinations(matrix1)
# p rotate90(matrix1)
# p rotate90(matrix2)

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
# This program should print "true" three times.
