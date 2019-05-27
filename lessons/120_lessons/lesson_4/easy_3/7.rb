# Question 7
#
# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# We don't use either the getter or setter methods defined by attr_accessor.
# We use a return statement inside the class method information but it doesn't add any value since the string is automatically returned as the return value of the method since it's the last line of the method.
