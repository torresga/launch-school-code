require './player'
# require './board'
# require './square'
require './output'

class Human < Player
  include Input
  attr_writer :name

  def set_name
    puts 'Enter your name:'
    name = ''
    loop do
      name = gets.chomp
      break unless name.strip.length.zero?
      puts 'Sorry, please enter a name.'
    end

    self.name = name
  end

  def choose_marker
    marker = ''
    puts "Choose a marker: #{MARKER_CHOICES.join(' or ')}"
    loop do
      marker = gets.chomp
      break if MARKER_CHOICES.include?(marker)
      puts "Sorry, that's not a valid choice."
    end
    marker
  end

  def choose_square(board)
    puts "Choose a square: #{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    square
  end
end

# gelsey = Human.new
# p gelsey
# gelsey.set_name
# gelsey.choose_marker
# gelsey.choose_square(Board.new)
