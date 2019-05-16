class Move
  VALUES = ['rock', 'paper', 'scissors', 'Spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def beats?(other_move)
    rock_wins?(other_move) ||
      paper_wins?(other_move) ||
      scissors_wins?(other_move) ||
      spock_wins?(other_move) ||
      lizard_wins?(other_move)
  end

  def to_s
    @value
  end

  protected

  def rock_wins?(other_move)
    (rock? && (other_move.lizard? || other_move.scissors?))
  end

  def paper_wins?(other_move)
    (paper? && (other_move.rock? || other_move.spock?))
  end

  def scissors_wins?(other_move)
    (scissors? && (other_move.paper? || other_move.lizard?))
  end

  def spock_wins?(other_move)
    (spock? && (other_move.scissors? || other_move.rock?))
  end

  def lizard_wins?(other_move)
    (lizard? && (other_move.spock? || other_move.paper?))
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'Spock'
  end

  def lizard?
    @value == 'lizard'
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
    @score = Score.new(0)
  end

  def score
    @score.value
  end

  def score=(score)
    @score.value = score
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
    self.move = Move.new(choice)
  end
end

class Computer < Player
  NAMES = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def set_name
    self.name = NAMES.sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Score
  MAX_SCORE = 10
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def to_s
    @value.to_s
  end
end

class RPSGame
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message

    loop do
      display_score
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
      break if [human.score, computer.score].include?(Score::MAX_SCORE)
    end

    display_score
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard! Goodbye!"
  end

  def display_score
    puts "#{human.name}'s score: #{human.score}"
    puts "#{computer.name}'s score: #{computer.score}"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move.beats?(computer.move)
      puts "#{human.name} won!"
      human.score += 1
    elsif computer.move.beats?(human.move)
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == "n"
    return true if answer.downcase == 'y'
  end
end

RPSGame.new.play
