class Player
  MARKER_CHOICES = %w(X O)
  attr_reader :name
  attr_accessor :marker, :score, :first_to_move

  def initialize
    @marker = ''
    @score = 0
    @name = ''
    @first_to_move = false
  end

  def reset
    self.score = 0
    self.marker = ''
    @first_to_move = false
  end

  def first_to_move?
    first_to_move
  end

  def other_marker
    Player::MARKER_CHOICES.reject do |choice|
      choice == marker
    end.first
  end

  def to_s
    @name
  end
end
