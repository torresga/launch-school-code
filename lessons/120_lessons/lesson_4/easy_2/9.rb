# Question 9
#
# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Let's play Bingo!"
  end
end

# What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# The new play method in Bingo will overwrite the play method found in Game.

b = Bingo.new
p b.play
