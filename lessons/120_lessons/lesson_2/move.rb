class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end
end

class Scissors < Move
  def won?(other_move)
    other_move.is_a?(Paper) || other_move.is_a?(Lizard)
  end
end

class Rock < Move
  def won?(other_move)
    other_move.is_a?(Lizard) || other_move.is_a?(Scissors)
  end
end

class Paper < Move
  def won?(other_move)
    other_move.is_a?(Rock) || other_move.is_a?(Spock)
  end
end

class Spock < Move
  def won?(other_move)
    other_move.is_a?(Scissors) || other_move.is_a?(Rock)
  end
end

class Lizard < Move
  def won?(other_move)
    other_move.is_a?(Spock) || other_move.is_a?(Paper)
  end
end
