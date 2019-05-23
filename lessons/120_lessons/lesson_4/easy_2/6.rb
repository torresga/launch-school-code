# Question 6
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

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# A class method is a method prefixed with the 'self' keyword. We can call a class method by using the class name followed by the method name:

p Television.manufacturer
