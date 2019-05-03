# Right Triangles
# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# Input: One positive integer
# Output: A string containing a right triangle
# Mental model: Given a positive integer, create a right triangle. On each iteration, start with one star, and n-1 spaces. Keep adding rows with an increasing number of stars and a decreasing number of spaces until you have n rows of n stars.

# Examples:

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****
# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

# Data structures
# Input is a positive integer. Output is a string.

# Algorithm
# Get input
# Create counter
# Assign 1 to counter
# Loop
#   Output a string with n-counter + counter stars
#   Add 1 to counter
#   Break if counter is equal to n

# Code
def triangle(n)
  counter = 1

  loop do
    puts "#{' ' * (n-counter)}#{'*' * counter}"
    counter += 1
    break if counter > n
  end
end

# triangle(5)
# triangle(9)

# Further Exploration
# Try modifying your solution so it prints the triangle upside down from its current orientation. Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

def triangle(n)
  n.downto(1) do |i|
    puts "#{'*' * i}#{' ' * (n-i)}"
  end
end

triangle(5)
triangle(9)
