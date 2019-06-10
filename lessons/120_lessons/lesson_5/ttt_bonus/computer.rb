require './player'

class Computer < Player
  COMPUTER_NAMES = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def initialize
    super
    @name = COMPUTER_NAMES.sample
  end

  def choose_marker
    MARKER_CHOICES.sample
  end

  def choose_square(board)
    if board.counter_move
      board.counter_move
    elsif board.unmarked_keys.include?(5)
      5
    else
      board.unmarked_keys.sample
    end
  end
end
