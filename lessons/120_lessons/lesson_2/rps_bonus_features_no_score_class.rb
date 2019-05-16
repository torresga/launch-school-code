require './move'
require './player'

class RPSGame
  SEPARATOR = "-"
  MAX_WIDTH = 20

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message

    loop do
      display_score
      display_history
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
      break if [human.score, computer.score].include?(Player::MAX_SCORE)
    end

    display_score
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!"
    puts SEPARATOR * MAX_WIDTH
  end

  def display_goodbye_message
    puts SEPARATOR * MAX_WIDTH
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard! Goodbye!"
  end

  def display_history
    puts "Move History"
    puts SEPARATOR * MAX_WIDTH
    history = Player.history
    history.each do |name, moves|
      moves = moves.map {|move| move.to_s }
      print "#{name}: #{moves} "
    end
  end

  def display_score
    puts "Current Score"
    puts SEPARATOR * MAX_WIDTH
    puts "#{human.name}'s score: #{human.score}"
    puts "#{computer.name}'s score: #{computer.score}"
  end

  def display_moves
    puts "Current Moves"
    puts SEPARATOR * MAX_WIDTH
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move.won?(computer.move)
      puts "#{human.name} won!"
      human.score += 1
    elsif computer.move.won?(human.move)
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
