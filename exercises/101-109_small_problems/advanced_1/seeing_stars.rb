# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

# Input: Odd integer - larger or equal to 7.
# Output: One star that fits a input X input grid.

# Figure out spacing in between stars
# Figure out how many lines to make stars

# 3 asterisks per line on lines

# Algorithm
# Loop n-1/2 times
#   spaces = (counter - 3) / 2
#   puts "*" + (" " * spaces) + "*"

# Output "*" times n times

# Loop n-1/2 times
#   puts "*" + (" " * spaces) + "*"
#   spaces = (counter - 3) / 2

# Code
def stars(n)
  (((n-1)/2)-1).downto(0) do |num|
    puts ("*" + (" " * num) + "*" + (" " * num) + "*").center(n)
  end

  puts "*" * n

  0.upto(((n-1)/2) - 1) do |num|
    puts ("*" + (" " * num) + "*" + (" " * num) + "*").center(n)
  end

end

p stars(7)
p stars(9)

# Examples

# star(7)

# p "*  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *".split("\n").each {|line| puts line.length }

# # star(9)

# "*   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *".split("\n").each {|line| puts line.length }
