# What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.
# A module is a collection of behaviors that is useable in classes. We can use the 'include' method to call a module that we create with the 'module' keyword.
module Eat
  def eat(food, amount)
    food = food + "s" if amount > 1
    puts "Ate #{amount} #{food}."
  end
end

class Dog
  include Eat
end

trip = Dog.new
trip.eat("cookie", 1)
trip.eat("cookie", 20)
