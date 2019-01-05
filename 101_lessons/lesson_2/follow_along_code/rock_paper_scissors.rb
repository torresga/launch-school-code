VALID_CHOICES = ['rock', 'paper', 'scissors']

# def test_method
#  prompt("blah!")
# end

# 2. test_method raises an undefined method error because
# the prompt method has been defined after the method invocation
# test_method

# def prompt(message)
#   Kernel.puts("=> #{message}")
# end
#
# test_method

# 1. the display_results method still works if it's defined
# before the prompt method, the loop below still works because
# display_results is invoked after both methods are defined

# 4. To reduce complexity, we can break up the conditional
# statements into two different methods
def player_wins?(player, computer)
  (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
end

def tie?(player, computer)
  player == computer
end

def display_results(player, computer)
  if tie?(player, computer)
    # 3.
    # "It's a tie!"
    prompt("It's a tie!")
  elsif player_wins?(player, computer)
    # 3.
    # "You won!"
    prompt("You won!")
  else
    # 3.
    # "Computer won!"
    prompt("Computer won!")
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  # 3. cont.
  # prompt(display_results(choice, computer_choice))

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
