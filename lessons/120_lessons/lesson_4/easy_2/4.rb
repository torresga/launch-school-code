# Question 4
#
# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

# By adding attr_accessor :type, Ruby's automatic way of creating getter and setter methods.

# We can also call the type getter method inside of the describe_type method instead of the instance variable.

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

b = BeesWax.new("honey")
b.describe_type
