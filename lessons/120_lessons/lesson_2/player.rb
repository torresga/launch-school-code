require './move'

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
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, Spock, or lizard:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    # self.move = Move.new(choice)
    self.move = Object.const_get(choice.capitalize).new(choice)
  end
end

class Computer < Player
  NAMES = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def set_name
    self.name = NAMES.sample
  end

  def choose
    # self.move = Move.new(Move::VALUES.sample)
    choice = Move::VALUES.sample
    self.move =
    Object.const_get(choice.capitalize).new(choice)
  end
end
