# Question 6
#
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

# We can reassign the value of the instance variable @age

grainne = Cat.new("tabby")
p grainne.make_one_year_older