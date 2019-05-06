# Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

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
end

kia = MyCar.new(2018, "black", "Kia Soul")
p kia
kia.speed_up(100)
kia.brake(20)
kia.shut_down

p kia.color
kia.color = "Alien green"
p kia.color

p kia.year
