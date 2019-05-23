# Question 8
#
# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. What does self refer to here?

# self refers to the calling object. In this context, we have to use self to reference the setter method 'age', otherwise Ruby will think we are assigning to a new local variable the return value of age + 1.
