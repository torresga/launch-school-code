# Bonus

# We use the play_again? three times: after the player busts, after the dealer busts, or after both participants stay and compare cards. Why is the last call to play_again? a little different from the previous two?
# play_again? ? next : break - using ternary operator
# if play_again? is true, the top-most loop will start over again at the beginning.
# break unless play_again?
# the loop is going to break except when play_again? equals true
#

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
TOTAL = 21
DEALER_TOTAL = 17
WIN_COUNT = 5

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > TOTAL
  end

  sum
end

def busted?(cards)
  total(cards) > TOTAL
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > TOTAL
    :player_busted
  elsif dealer_total > TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_cards(dealer_cards, dealer_total, player_cards, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

player_win_count = 0
dealer_win_count = 0
loop do
  prompt "Welcome to Twenty-One!"

  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  player_total = 0
  dealer_total = 0

  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_win_count == WIN_COUNT
    prompt "Player won the game!"
    break
  elsif dealer_win_count == WIN_COUNT
    prompt "Dealer won the game!"
    break
  end

  prompt "Total player wins: #{player_win_count} Total dealer wins: #{dealer_win_count}"
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_cards(dealer_cards, dealer_total, player_cards, player_total)
    display_result(dealer_cards, player_cards)
    dealer_win_count += 1
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if dealer_total >= DEALER_TOTAL

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{dealer_total}"
    display_cards(dealer_cards, dealer_total, player_cards, player_total)
    display_result(dealer_cards, player_cards)
    player_win_count += 1
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stays - compare cards!
  display_cards(dealer_cards, dealer_total, player_cards, player_total)

  display_result(dealer_cards, player_cards)

  # update score after comparing cards
  winner = detect_result(dealer_cards, player_cards)

  if winner == :player
    player_win_count += 1
  elsif winner == :dealer
    dealer_win_count += 1
  end
end

prompt "Thank you for playing Twenty-One! Good bye!"
