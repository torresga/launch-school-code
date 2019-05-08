# Add a class method to your MyCar class that calculates the gas mileage of any car.

class MyCar
  attr_accessor :year, :color, :model, :current_speed

  def self.mileage(miles, gallons)
    miles / gallons
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
    puts "You turned the car off"
  end
end

kia = MyCar.new(2018, "black", "Kia Soul", 50)
p kia
kia.speed_up(100)
kia.brake(20)
kia.shut_down

p MyCar.mileage(50, 50)
