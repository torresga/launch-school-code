# Number Guesser Part 2
#
# In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.
#
# Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:
#
# Math.log2(size_of_range).to_i + 1
#

class GuessingGame
  attr_reader :guesses_remaining
  attr_accessor :player_guess

  def initialize(low, high)
    @range = (low..high)
    # If we define @winning_number to be nil here, and then define it inside a private method, at least we won't be able to see the value until we call it from another method
    @winning_number = nil
    @guesses_remaining = Math.log2(@range.to_a.length).to_i + 1
    @player_guess = 0
  end

  def play
    reset
    while guesses_remaining?
      display_remaining_guesses
      player_turn
      break if player_won?
      subtract_player_guesses
      display_hint
    end

    display_result
  end

  private
  attr_writer :guesses_remaining

  def reset
    @winning_number = rand(@range)
  end

  def player_won?
    player_guess == @winning_number
  end

  def guesses_remaining?
    guesses_remaining > 0
  end

  def display_hint
    if player_guess > @winning_number
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
    puts ''
  end

  def display_remaining_guesses
    if guesses_remaining == 1
      puts "You have #{guesses_remaining} guess remaining."
    else
      puts "You have #{guesses_remaining} guesses remaining."
    end
  end

  def display_result
    puts ''

    if player_won?
      puts "That's the number! You won!"
    else
      puts "You have no guesses left. You lost!"
    end
  end

  def player_turn
    print "Enter a number between #{@range.first} and #{@range.last}: "
    guess = nil
    loop do
      guess = gets.chomp.to_i
      break if @range.cover?(guess)
      print "Invalid guess. Enter a number between #{@range.first} and #{@range.last}: "
    end
    self.player_guess = guess
  end

  def subtract_player_guesses
    self.guesses_remaining -= 1
  end
end

game = GuessingGame.new(501, 1500)
game.play

# Examples:
#
# game = GuessingGame.new(501, 1500)
# game.play
#
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.
#
# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.
#
# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.
#
# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low.
#
# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low.
#
# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high.
#
# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high.
#
# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# That's the number!
#
# You won!
#
# game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high.
#
# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low.
#
# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high.
#
# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low.
#
# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high.
#
# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low.
#
# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low.
#
# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low.
#
# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low.
#
# You have 1 guesses remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low.
#
# You have no more guesses. You lost!
#
# Note that a game object should start a new game with a new number to guess with each call to #play.
