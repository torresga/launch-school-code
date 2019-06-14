# Number Guesser Part 1

# Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

# game = GuessingGame.new
# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!
#
# You won!
#
# game.play
#
# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.
#
# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.
#
# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.
#
# You have no more guesses. You lost!
#
# Note that a game object should start a new game with a new number to guess with each call to #play.

class GuessingGame
  GUESS_LIMIT = 7
  attr_reader :guesses_remaining
  attr_accessor :player_guess

  def initialize
    # We can get random number and assign it to winning_number
    # We can initialize a variable in here to track the number of guesses, initially set it to GUESS_LIMIT
    @winning_number = rand(100)
    @guesses_remaining = GUESS_LIMIT
    @player_guess = 0
  end

  def play
    # Start new game with a new number to guess
    # Loop do
    #   Display remaining_guesses
    #   Get input
    #   Break if won? or no guesses remaining
    #   Tell user if their guess is too high or low
    #   Subtract 1 from remaining_guesses
    loop do
      break if player_won? || no_guesses_remaining?
      display_remaining_guesses
      player_turn
      subtract_player_guesses
      display_hint
    end

    display_result
  end

  private
  attr_writer :guesses_remaining

  def player_won?
    player_guess == @winning_number
  end

  def no_guesses_remaining?
    guesses_remaining == 0
  end

  def display_hint
    if player_guess > @winning_number
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
  end

  def display_remaining_guesses
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def display_result
    if player_won?
      puts "That's the number! You won!"
    else
      puts "You have no guesses left. You lost!"
    end
  end

  def player_turn
    print "Enter a number between 1 and 100: "
    guess = nil
    loop do
      guess = gets.chomp.to_i
      break if (1..100).cover?(guess)
      print "Invalid guess. Enter a number between 1 and 100: "
    end
    self.player_guess = guess
  end

  def subtract_player_guesses
    self.guesses_remaining -= 1
  end
end

game = GuessingGame.new
game.play
