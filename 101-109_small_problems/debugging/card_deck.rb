# Card Deck
# We started working on a card game but got stuck. Check out why the code below raises a TypeError.

# Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

p player_cards

# Determine the score of the remaining cards in the deck

total = deck.reduce(0) do |sum, (_, remaining_cards)|
  sum + remaining_cards.map do |card|
    score(card)
  end.sum
end

p total

# TypeError was because we were calling map on remaining_cards to create a new array of scores, but we weren't calling #sum on that new array - we were calling #sum on the original remaining_cards array.

# What are we trying to do here? It looks like each of these random cards do not appear in any of the decks - is that what we are looking for?
