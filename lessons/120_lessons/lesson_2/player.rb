require './move'
require './input'

class Player
  MAX_SCORE = 10
  @@history = {}
  attr_accessor :name, :score
  attr_reader :move

  def initialize
    set_name
    @score = 0
    @@history[name] = []
  end

  def self.history
    @@history
  end

  def move=(move)
    @move = move
    @@history[name] << move
  end
end

class Human < Player
  include Input

  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    messages = [
      "Please choose rock, paper, scissors, Spock, or lizard:",
      "Sorry, invalid choice."
    ]

    choice = get_input(messages, Move::VALUES)
    self.move = Object.const_get(choice.capitalize).new(choice)
  end
end

class Computer < Player
  # Let's have a hash - key is names and frequencies is an array of floats

  NAMES = {
    'R2D2' => [0.0, 1.0, 0.0, 0.0, 0.0],
    'Hal' => [0.0, 0.5, 0.4, 0.1, 0.0],
    'Chappie' => [0.1, 0.1, 0.1, 0.6, 0.1],
    'Sonny' => [0.3, 0.3, 0.2, 0.1, 0.2],
    'Number 5' => [0.3, 0.3, 0.2, 0.1, 0.1]
  }

  def set_name
    self.name = NAMES.keys.sample
  end

  def choose
    # Create a hash with each move as a key, each frequency as a value
    # Then we can loop over each frequency
    # and then we can perform rand**(1.0/weight)
    # Return first element

    frequencies = NAMES[name]

    moves_and_freqs = Move::VALUES.zip(frequencies).to_h

    choice = moves_and_freqs.max_by do |_, weight|
      rand**(1.0 / weight)
    end.first

    self.move =
      Object.const_get(choice.capitalize).new(choice)
  end
end
