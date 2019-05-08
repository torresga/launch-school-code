# Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.

module FourWheelDriveable
  def is_drive_on?
    true
  end
end

class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :year, :color, :model, :current_speed

  def initialize(year, color, model)
    self.year = year
    self.color = color
    self.model = model
    self.current_speed = 0
    @@number_of_vehicles += 1
  end

  def self.mileage(miles, gallons)
    miles / gallons
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end

  def to_s
    "Here are the details of your new #{self.class}:
    Year: #{year}
    Model: #{model}
    Color: #{color}
    Current speed: #{current_speed}"
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
end

class MyTruck < Vehicle
  include FourWheelDriveable
  TYPE = "Truck"
end

kia = MyCar.new(2018, "Black", "Kia Soul")
malibu = MyCar.new(2005, "Black", "Chevy Malibu")
tahoe = MyTruck.new(2019, "Yellow", "Chevy Tahoe")

puts kia
puts malibu
puts tahoe
