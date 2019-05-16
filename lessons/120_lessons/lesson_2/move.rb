# class Move
#   VALUES = ['rock', 'paper', 'scissors', 'Spock', 'lizard']
#
#   def initialize(value)
#     @value = value
#   end
#
#   def beats?(other_move)
#     rock_wins?(other_move) ||
#       paper_wins?(other_move) ||
#       scissors_wins?(other_move) ||
#       spock_wins?(other_move) ||
#       lizard_wins?(other_move)
#   end
#
#   def to_s
#     @value
#   end
#
#   protected
#
#   def rock_wins?(other_move)
#     (rock? && (other_move.lizard? || other_move.scissors?))
#   end
#
#   def paper_wins?(other_move)
#     (paper? && (other_move.rock? || other_move.spock?))
#   end
#
#   def scissors_wins?(other_move)
#     (scissors? && (other_move.paper? || other_move.lizard?))
#   end
#
#   def spock_wins?(other_move)
#     (spock? && (other_move.scissors? || other_move.rock?))
#   end
#
#   def lizard_wins?(other_move)
#     (lizard? && (other_move.spock? || other_move.paper?))
#   end
#
#   def scissors?
#     @value == 'scissors'
#   end
#
#   def rock?
#     @value == 'rock'
#   end
#
#   def paper?
#     @value == 'paper'
#   end
#
#   def spock?
#     @value == 'Spock'
#   end
#
#   def lizard?
#     @value == 'lizard'
#   end
# end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'Spock', 'lizard']

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
