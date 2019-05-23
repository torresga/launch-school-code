# Question 7
#
# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end

  def cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# @@cats_count is a class variable. All objects of a class have access to a class variable. So all instances of Cat will have access to the @@cats_count variable. In this application, @@cats_count keeps track of how many Cat objects have been instantiated.

# In order to access the @@cats_count variable, we would have to write an instance method that returns the value of the @@cats_count variable. Then we could access it like so:

grainne = Cat.new("tabby")
p grainne.cats_count

# We could also call the class method cats_count
p Cat.cats_count
