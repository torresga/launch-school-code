# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.
#
# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.
class Vehicle
  attr_accessor :year, :color, :model, :current_speed

  def self.mileage(miles, gallons)
    miles / gallons
  end

  def to_s
    "Here are the details of your new #{self.class}:
    Year: #{year}
    Model: #{model}
    Color: #{color}
    Current speed: #{current_speed}"
  end

  def initialize(year, color, model, gas_level)
    self.year = year
    self.color = color
    self.model = model
    self.current_speed = 0
  end

  def speed_up(number)
    self.current_speed += number
    puts "You are now going #{current_speed}"
  end

  def brake(number)
    self.current_speed -= number
    puts "You are now going #{current_speed}"
  end

  def shut_down
    self.current_speed = 0
    puts "You turned the #{self.class} off"
  end
end

class MyCar < Vehicle
  TYPE = "Car"

  def type
    TYPE
  end
end

class MyTruck < Vehicle
  TYPE = "Truck"

  def type
    TYPE
  end
end

kia = MyCar.new(2018, "black", "Kia Soul", 50)
p kia.type
kia.speed_up(100)
kia.brake(20)
kia.shut_down

puts kia

tahoe = MyTruck.new(2019, "yellow", "Chevy Tahoe", 100)
p tahoe.type
puts tahoe
