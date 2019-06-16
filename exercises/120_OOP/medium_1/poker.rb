# Poker!

# In the previous two exercises, you developed a Card class and a Deck class. You are now going to use those classes to create and evaluate poker hands. Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards as a Poker hand.

# You should build your class using the following code skeleton:

# Include Card and Deck classes from the last two exercises.

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = reset
  end

  def draw
    if cards.empty?
      self.cards = reset
    end
    cards.shuffle!.shift
  end

  def reset
    SUITS.map do |suit|
      RANKS.map do |rank|
        Card.new(rank, suit)
      end
    end.flatten
  end

  private

  attr_accessor :cards
end

class PokerHand
  HAND_AMOUNT = 5
  def initialize(deck)
    @deck = deck
    # need to deal 5 cards here for a hand
    @hand = reset
  end

  def print
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    # A straight flush of the top five cards of any suit. This is generally the highest possible hand.
  end

  def straight_flush?
    # A straight flush is a hand that contains five cards of sequential rank, all of the same suit, such as Q♥ J♥ 10♥ 9♥ 8♥ (a "queen-high straight flush").[4] It ranks below five of a kind and above four of a kind.
  end

  def four_of_a_kind?
    # Four of a kind, also known as quads, is a hand that contains four cards of one rank and one card of another rank (the kicker), such as 9♣ 9♠ 9♦ 9♥ J♥ ("four of a kind, nines"). It ranks below a straight flush and above a full house.[6]
  end

  def full_house?
    # A full house, also known as a full boat or a boat (and originally called a full hand), is a hand that contains three cards of one rank and two cards of another rank, such as 3♣ 3♠ 3♦ 6♣ 6♥ (a "full house, threes over sixes" or "threes full of sixes" or "threes full").[19][20] It ranks below four of a kind and above a flush.
  end

  def flush?
    # A flush is a hand that contains five cards all of the same suit, not all of sequential rank, such as K♣ 10♣ 7♣ 6♣ 4♣ (a "king-high flush" or a "king-ten-high flush").[21] It ranks below a full house and above a straight.[6] Under ace-to-five low rules, flushes are not possible (so J♥ 8♥ 4♥ 3♥ 2♥ is a jack-high hand).
  end

  def straight?
    # A straight is a hand that contains five cards of sequential rank, not all of the same suit, such as 7♣ 6♠ 5♠ 4♥ 3♥ (a "seven-high straight"). It ranks below a flush and above three of a kind.[6] Under high rules, an ace can rank either high (as in A♦ K♣ Q♣ J♦ 10♠, an ace-high straight) or low (as in 5♣ 4♦ 3♥ 2♥ A♠, a five-high straight), but cannot simultaneously rank both high and low (so Q♠ K♠ A♣ 2♥ 3♦ is an ace-high hand).[7][15] Under deuce-to-seven low rules, an ace always ranks high (so 5♥ 4♠ 3♥ 2♣ A♦ is an ace-high hand). Under ace-to-six low rules, an ace always ranks low (so A♣ K♠ Q♠ J♦ 10♠ is a king-high hand).[16] Under ace-to-five low rules, straights are not possible (so 10♥ 9♠ 8♣ 7♣ 6♦ is a ten-high hand).[8]
  end

  def three_of_a_kind?
    # Three of a kind, also known as trips or a set, is a hand that contains three cards of one rank and two cards of two other ranks (the kickers), such as 2♦ 2♠ 2♣ K♠ 6♥ ("three of a kind, twos" or "trip twos" or a "set of twos"). It ranks below a straight and above two pair.[6]
    #
    set_count = 0
    ranks.each do |rank|
      set_count += 1 if ranks.count(rank) == 3
    end

    set_count == 3
  end

  def two_pair?
    ranks.uniq.size == 3
  end

  def pair?
    unique_rank_count = 0

    ranks.each do |rank|
      unique_rank_count += 1 if ranks.count(rank) == 1
    end

    unique_rank_count == 3
  end

  def ranks
    @hand.map { |card| card.rank }
  end

  def reset
    cards = []
    5.times do
      cards << @deck.draw
    end

    cards
  end
end

# Testing your class:

hand = PokerHand.new(Deck.new)

# hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# puts hand.evaluate == 'Royal flush'
#
# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'
#
# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'
#
# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'
#
# hand = PokerHand.new([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand.evaluate == 'Flush'
#
# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'
#
# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'
#
hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

# Output:
#
# 5 of Clubs
# 7 of Diamonds
# Ace of Hearts
# 7 of Clubs
# 5 of Spades
# Two pair
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
#
# The exact cards and the type of hand will vary with each run.
#
# Most variants of Poker allow both Ace-high (A, K, Q, J, 10) and Ace-low (A, 2, 3, 4, 5) straights. For simplicity, your code only needs to recognize Ace-high straights.
