# Question 5
#
# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer
# This will return a NoMethodError because manufacturer is not an instance method, but a class method.
tv.model
# This will return the model

Television.manufacturer
# This will return the manufacturer
Television.model
# This will return a NoMethodError because model is an instance method, not a class method.
