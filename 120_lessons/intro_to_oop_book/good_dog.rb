class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says 'arf!'"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
end

trip = GoodDog.new('Trip', '36 inches', '60 lbs')
p trip.info
trip.change_info('Tripperson', "12 inches", "15 lbs")
p trip.info
