# Rectangles and Squares
#
# Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

# Write a class called Square that inherits from Rectangle, and is used like this:

class Square < Rectangle
  # We can overwrite initialize to take only one argument
  # Then call super and pass in that argument twice:
  def initialize(side)
    super(side, side)
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"
