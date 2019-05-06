# Transpose MxN
# In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

# Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

# Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

# Input: An array of arrays - inner and outer array can be of any length
# Output: A new transposed array

# Row is considered each element of array
# And column is how many arrays in array

# Algorithm:

# Get columns (how many arrays in array) - input.length
# Get rows (how many elements in array) - input[current].length

# Create new array
# Loop row times
#   Loop column times
#     Append arr[row][column] to array

# Return array

def transpose(arr)
  columns = arr.max.length-1

  (0..columns).map do |column|
    (0..arr.length-1).map do |row|
      arr[row][column]
    end

  end
end
# Examples:

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
