# Triangle Sides
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# Input: 3 numbers
# Output: a symbol depending on whether the triangle is equilateral, isoceles, scalene, or invalid.

# Have to find two shortest sides. Maybe using sort? And then compare sum of shortest sides to the third.

# All sides must be greater than 0.

# Examples:

# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid

# Data Structures

# Store sides in an array

# Algorithm

# Add three numbers into an array
# Sort numbers
# If sum of first two numbers is greater than third, or numbers include zero?
#   Invalid triangle

# case all three numbers are equal
#   equilateral
# when two numbers are equal
#   isosceles
# else
#   scalene

# Code

def triangle(num1, num2, num3)
  sides = [num1, num2, num3]

  sides.sort!

  return :invalid if sides[0..1].sum <= sides.last


  if sides.uniq.size == 1
    :equilateral
  elsif sides.uniq.size == 2
    :isosceles
  elsif sides.uniq.size == 3
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
