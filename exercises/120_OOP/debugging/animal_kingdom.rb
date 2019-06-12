# Animal Kingdom

# The code below raises an exception. Examine the error message and alter the code so that it runs without error.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  # This method is not necessary since it doesn't change the initialize method set up inside of Animal.
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  # Since we are adding a new argument here, we need to define which arguments should be supplied to super
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

p unicornfish
p penguin
p robin
