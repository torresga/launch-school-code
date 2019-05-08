# Override the to_s method to create a user friendly print out of your object.

class MyCar
  attr_accessor :year, :color, :model, :current_speed

  def self.mileage(miles, gallons)
    miles / gallons
  end

  def to_s
    "Here are the details of your new car:
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
    puts "You turned the car off"
  end
end

kia = MyCar.new(2018, "black", "Kia Soul", 50)
p kia
kia.speed_up(100)
kia.brake(20)
kia.shut_down

puts kia
