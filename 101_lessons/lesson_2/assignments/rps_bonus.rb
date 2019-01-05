# Assignment 1. Add Lizard and Spock to the code
# Assignment 2. Type 'r' for 'rock', 'p' for paper
# Assignment 3. Keep track of player and computers' score

# TO do: can we move the loops that check both the internal input and the choice into different methods?

KILL_MOVES = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['scissors', 'rock']
}

VALID_CHOICES = %w(rock paper scissors lizard spock)

ROUNDS = 5

def calculate_winner(player, computer)
  if player == computer
    "tie"
  elsif KILL_MOVES[player.to_sym].include?(computer)
    "player"
  else
    "computer"
  end
end

def display_results(player, computer)
  if player == ROUNDS && computer == ROUNDS
    prompt("It's a tie!")
  elsif player == ROUNDS
    prompt("You won the round!")
  else
    prompt("Computer won the round!")
  end
end

def update_score(current_score)
  current_score + 1
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

computer_score = 0
player_score = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Type the first letter of your choice")
    prompt("Or 'sc' for scissors and 'sp' for spock)")

    input = ''
    loop do
      input = Kernel.gets().chomp()

      if input != "s"
        break
      else
        prompt("Sorry, there are two choices starting with 's'.")
      end
    end

    choice = VALID_CHOICES.find_all { |s| s.start_with?(input) }.first

    if choice
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  winner = calculate_winner(choice, computer_choice)

  player_score = update_score(player_score) if winner == "player" ||
                                               winner == "tie"

  computer_score = update_score(computer_score) if winner == "computer" ||
                                                   winner == "tie"

  Kernel.puts("Your score: #{player_score}; Computer score: #{computer_score}")
  Kernel.puts("Next round!\n\n")
  
  break if computer_score == ROUNDS || player_score == ROUNDS
end

display_results(player_score, computer_score)
prompt("Thank you for playing. Good bye!")
