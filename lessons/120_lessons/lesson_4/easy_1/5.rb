# Question 5
#
# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The Pizza class has an instance variable @name. You can tell that @name is an instance variable because it has an @ in front of its' name.

apple = Fruit.new("apple")
p apple.instance_variables

pepperoni_and_cheese = Pizza.new("Pepperoni and Cheese")
p pepperoni_and_cheese.instance_variables
