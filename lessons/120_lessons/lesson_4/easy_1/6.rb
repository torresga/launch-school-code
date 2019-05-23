# Question 6
#
# What could we add to the class below to access the instance variable @volume?

# To access the instance variable, we can create a getter method. There are two ways we can do this:
#
# The Ruby method attr_reader, which takes one symbol for the instance variable name and returns a method that returns the value of the instance variable:

# Or we can create our own getter method, typically the name of the instance variable, and returns the value of the instance value.

class Cube
  # attr_reader :volume

  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

c = Cube.new(13)
p c.volume

# Or we can use this, apparently:
# p c.instance_variable_get("@volume")
