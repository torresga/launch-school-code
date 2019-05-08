# You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You are now going #{@current_speed}"
  end

  def brake(number)
    @current_speed -= number
    puts "You are now going #{@current_speed}"
  end

  def shut_down
    @current_speed = 0
    puts "You turned the car off"
  end

  def spray_paint(color)
    self.color = color
  end
end

kia = MyCar.new(2018, "black", "Kia Soul")
p kia.color

kia.spray_paint("Caribbean blue")
p kia.color
