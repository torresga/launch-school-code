# Complete the Program - Cats!
#
# Consider the following program.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  # don't entirely need to but we can create an attr reader here for all three variables
  attr_reader :name, :age, :color

  # overwrite initialize method to take three arguments
  # Then call super to initialize the first two arguments
  # and then assign third argument to new instance variable
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  # Then create a to_s method to print out all three variables
  def to_s
    "My cat #{name} is #{age} and has #{color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Update this code so that when you run it, you see the following output:
#
# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.
