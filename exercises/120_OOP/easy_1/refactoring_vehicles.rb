# Refactoring Vehicles
#
# Consider the following classes:

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

car = Car.new("Toyota", "Camry")
moto = Motorcycle.new("Zard", "Ducati")
truck = Truck.new("Dodge", "Ram", 2000)

p car.wheels
p moto.wheels
p truck.wheels

# Refactor these classes so they all use a common superclass, and inherit behavior as needed.

# Further Exploration
#
# Would it make sense to define a wheels method in Vehicle even though all of the remaining classes would be overriding it? Why or why not? If you think it does make sense, what method body would you write?

# I think it would make sense if each class had an instance variable wheels and then wheels could get the value of that.
