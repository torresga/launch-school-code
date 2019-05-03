# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

# Input: An odd integer (greater than zero?)
# Output: A diamond of the length of integer and full width of integer.
# Mental model of problem: Given an odd integer, output a diamond of width integer and length integer.

# Examples

# diamond(1)

# *

# diamond(3)

#  *
# ***
#  *

# diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# Data Structures

# Input is a positive odd integer.
# Output is a multi-line string.

# Algorithm

# Create counter
# Until input equals counter
#   Multiply "*" times counter
#   Output stars
#   Add +2 to counter

# Until counter is less than 1
#   Subtract 2 from counter
#   Multiply "*" times counter
#   Output stars

# Code

def diamond(n)
  counter = 1

  until counter == n
    spaces = " " * ((n - counter)/2)
    # puts "#{spaces} #{"*" * counter} #{spaces}"
    stars = "*" * counter
    puts stars.center(n)
    counter += 2
  end

  until counter < 1
    spaces = " " * ((n - counter)/2)
    #  puts "#{spaces} #{"*" * counter} #{spaces}"
     stars = "*" * counter
    puts stars.center(n)
    counter -= 2
  end

end

diamond(1)
puts ""
diamond(3)
puts ""
diamond(9)

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center # Ruby follows order of operations so 2 is multiplied by distance_from_center and the result is subtracted from grid_size
#Instead of my example, where I relied on a counter that increased by 2 to get the number of stars, in this example they got the number of stars by multiplying the distance (half the number of grid down to 0 and then 1 up to half the number of grid) by two, for the distance on each side, and then subtracting that from the grid size.
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2 # This creates the diamond halfs
  max_distance.downto(0) { |distance| print_row(grid_size, distance) } # This is half the rows +1
  # 1.upto(max_distance)   { |distance| print_row(grid_size, distance) } # This is the other half of the rows
end

# diamond(1)
# puts ""
# diamond(3)
# puts ""
# diamond(9)

# Further Exploration
# Try modifying your solution or our solution so it prints only the outline of the diamond:

# diamond(5)

#   *
#  * *
# *   *
#  * *
#   *

# In this example, instead of having an odd number of stars in each row, each row will have two visible stars only. So we will have to calculate the number of stars in between the two stars.


def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  number_of_star_spaces = number_of_stars - 2
  stars = number_of_star_spaces > 0 ? "*#{" " * number_of_star_spaces}*" : "*" * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2 # This creates the diamond halfs
  max_distance.downto(0) { |distance| print_row(grid_size, distance) } # This is half the rows +1
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) } # This is the other half of the rows
end

diamond(5)
diamond(9)
diamond(3)
