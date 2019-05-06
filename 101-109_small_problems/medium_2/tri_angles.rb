# Tri-Angles
# A triangle is classified as follows:

# right: One angle of the triangle is a right angle (90 degrees)
# acute: All 3 angles of the triangle are less than 90 degrees
# obtuse: One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

# Input: 3 integer numbers each less than 180 and greater than 0
# Output: a symbol
# Mental model: Take three numbers that represent the three angles of a triangle, and return whether that triangle is right, acute, obtuse, or invalid. All numbers have to add up to 180 and none of the angles can be 0.

# Examples:

# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid

# Data Structure

# angles can be stored in array to use array methods on them

# Algorithm

# Add three numbers to array

# Return invalid if any angle is 0 or the sum of the angles is less or more than 180

# If there's one right angle
#   return right
# If all angles are less than 90 degrees
#   return acute
# else
#   return obtuse

# Code

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid if angles.any? {|x| x == 0 } || angles.sum != 180

  case
    when angles.any? {|x| x == 90 }
      :right
    when angles.all? {|x| x < 90 }
      :acute
    else
      :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
