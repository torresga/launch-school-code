# Question 6
#
# If we have these two methods:

# class Computer
#   # This creates getter and setter methods for @template
#   attr_accessor :template
#
#   # Not using setter method here. Assigning a value directly to instance variable:
#   def create_template
#     @template = "template 14231"
#   end
#
#   # Using the getter method template
#   def show_template
#     template
#   end
# end

# and

class Computer
  # This creates getter and setter methods for @template
  attr_accessor :template

  # This is using the setter method template:
  def create_template
    self.template = "template 14231"
  end

  # This is also calling the getter method template. Self is optional when calling getter methods.
  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

c = Computer.new
c.create_template
p c
p c.show_template
