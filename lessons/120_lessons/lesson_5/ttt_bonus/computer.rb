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
    board.unmarked_keys.sample
  end
end
