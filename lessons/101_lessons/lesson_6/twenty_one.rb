# PEDAC
#
# Goal: Try to get as close to 21 as possible without going over.
#
# Identify expected input or output
# Make requirements explicit
# Identify rules
# Mental models of problem

# Game consists of dealer and player.
# Dealer gets two cards
# Player gets two cards
# Player can see their two cards and one of dealer's cards.
#
# Cards 2-10 are face values
# Jack, Queen, King, are 10
# Ace is 1 or 11
#
# Player can either hit or stay
# Hit means ask for another card
# Stay means don't ask for another card
#
# Player is user. Dealer is computer.
# Dealer hits (asks for another card) until total is at least 17.
# If dealer's total is >= 17 and dealer has not busted, then dealer stays.
#
# Then compare cards and determine who has the highest value.

# Create examples/test cases

# pp numerical_values(["Ace", "Ace","10"]) # should be [1, 1, 10]
# pp numerical_values(["2", "3", "Ace"]) # [2, 3, 11]
# pp numerical_values(["2", "Ace", "Ace"]) #=> [2, 11, 1]
# pp numerical_values(["2", "Ace", "10", "Ace"]) #=> [2, 1, 10, 1]
# pp numerical_values(["2", "Ace", "Ace", "10"]) # [2, 1, 1, 10]
# pp numerical_values(["10", "Ace", "Ace"]) #[10, 1, 1]
# pp numerical_values(["Ace", "Ace"]) # [11, 1]
# pp numerical_values(["Ace", "Ace", "Ace"]) #[11, 1, 1]
# pp numerical_values(["Ace", "Ace", "Ace", "10"]) #[1, 1, 1, 10]
# pp numerical_values(["Ace", "Ace","9"]) #[11, 1, 9]
# pp numerical_values(["Ace", "10"]) #This last one should be [11, 10]
# pp numerical_values(["10", "Ace"]) #This last one should be [10, 11]
# pp numerical_values(["Jack", "Queen", "King"])
# pp numerical_values(["Ace", "Ace"])


# Data Structures
# Deck - probably hash
#
# Player's Cards - array
#
# Dealer's cards - array
#
# How do we initialize a deck? Should the deck be in some sort of order?
# Or should we pick random cards for each person and remove those from the deck?

# It starts with a normal 52-card deck consisting of the 4 suits
# (hearts, diamonds, clubs, and spades), and 13 values
# (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).

# Algorithm
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# Code

CARD_TOTAL = 21
DEALER_TOTAL = 17
WIN_COUNT = 5

MASTER_DECK = {
  hearts: ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"],
  diamonds: ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"],
  clubs: ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"],
  spades: ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
}

VALUES = {
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "10" => 10,
  "Jack" => 10,
  "Queen" => 10,
  "King" => 10,
  "Ace" => "Ace"
}

# How do we figure out whether Ace is 1 or 11?
# ace's value is determined each time a new card is drawn from the deck.
# 2, ace - ace is 11
# 2, ace, ace - first ace is 11, second is 1
# and then have 2, ace, 10 - ace is 1
# ace, ace - first is 11, second is 1
# ace, ace, ace - first is 11, next two are 1
# ace, ace, ace, ace - first is 11, next three are 1
# if you remove the aces, and the rest of the numbers's sum
# is <= 10, then first ace is 11 and any remaining ones are 1
# else, aces are 1

def values(cards)
  card_values = cards.map { |card| VALUES[card] }
  without_aces = card_values.select { |card| card != "Ace" }

  ace_count = card_values.count("Ace")

  ace_value = 0
  ace_count.times do
    if without_aces.sum < 10
      ace_value = 11
    elsif without_aces.sum == 10 && ace_count == 1
      ace_value = 11
    else
      ace_value = 1
    end

    index = card_values.index("Ace")
    card_values[index] = ace_value
    without_aces.push(ace_value)
  end

  card_values
end

def total(cards)
  values(cards).sum
end

def busted?(total)
  total > CARD_TOTAL
end

def determine_winner(player_total, dealer_total)
  if player_total > dealer_total
    "Player"
  elsif player_total == dealer_total
    "Tie"
  else
    "Dealer"
  end
end

def display_winner(winner, type)
  if winner == "Tie"
    puts "It's a tie! Nobody wins!"
  else
    puts "#{winner} wins the #{type}!"
  end
end

def play_again?
  puts "Do you want to play again?"
  answer = gets.chomp.downcase
  true if answer.include?("y")
end

player_win_count = 0
dealer_win_count = 0

loop do
# initialize deck
current_deck = MASTER_DECK.values.flatten
current_deck.shuffle!

# deal cards
player_cards = current_deck.shift(2)
dealer_cards = current_deck.shift(2)

puts "\n"
puts "WELCOME TO TWENTY ONE"
puts "=============="
puts "Player win count: #{player_win_count} Dealer win count: #{dealer_win_count}"
puts "\n"
puts "Dealer has: #{dealer_cards.first} and unknown card"
puts "=============="
puts "\n"

# player turn - hit or stay
# repeat until bust or stay
winner = ''
player_total = 0
dealer_total = 0

loop do
  answer = nil

  loop do
    player_total = total(player_cards)

    puts "\n"
    puts "Your current cards: #{player_cards}"
    puts "Your current total: #{player_total}"

    print "Do you want to hit or stay? "
    answer = gets.chomp.downcase
    break if answer.include?('s') || busted?(player_total)

    new_card = current_deck.shift
    player_cards.push(new_card)
  end

  if busted?(player_total)
    winner = 'Dealer'
    break
  else
    puts "\nYou chose to stay!"
  end

  # dealer's turn

  loop do
    dealer_total = total(dealer_cards)
    break if dealer_total >= DEALER_TOTAL

    new_card = current_deck.shift
    dealer_cards.push(new_card)
  end

  # compare cards
  winner = if busted?(dealer_total)
             "Player"
           else
             determine_winner(player_total, dealer_total)
           end
  break
end

puts "\n"
puts "GAME OVER"
puts "=============="
puts "Player's cards: #{player_cards} Final total: #{player_total}"
puts "Dealer's cards: #{dealer_cards} Final total: #{dealer_total}"
display_winner(winner, "round")
puts "=============="

if winner == "Player"
  player_win_count += 1
elsif winner == "Dealer"
  dealer_win_count += 1
end

if player_win_count == WIN_COUNT || dealer_win_count == WIN_COUNT
  display_winner(winner, "game")
  break
end

end
