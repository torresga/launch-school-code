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

  attr_accessor :cards

  def initialize
    @cards = reset
  end

  # The Deck class should provide a #draw method to draw one card at random. If the deck runs out of cards, the deck should reset itself by generating a new set of 52 cards.
  def draw
    # if cards is empty?
        # reset cards

    if cards.empty?
      self.cards = reset
    end
    # Pick random card
    card = cards.sample
    # Remove the card from deck
    # return the card
    card
  end

  def reset
    # Generate cards here
    SUITS.map do |suit|
      RANKS.map do |rank|
        Card.new(rank, suit)
      end
    end.flatten
  end
end

# Examples:

# deck = Deck.new
# p deck
# p deck.draw

deck = Deck.new
puts deck.cards
drawn = []
52.times { drawn << deck.draw }
puts ''
puts "Drawn cards"
puts '-' * 20
puts ''
puts drawn.sort
puts drawn.size
puts ''
puts "Cards still in deck"
puts '-' * 20
puts ''
puts deck.cards
# puts drawn.select { |card| card.suit == 'Hearts' }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13
#
# drawn2 = []
# 52.times { drawn2 << deck.draw }
# drawn != drawn2 # Almost always.

# Note that the last line should almost always be true; if you shuffle the deck 1000 times a second, you will be very, very, very old before you see two consecutive shuffles produce the same results. If you get a false result, you almost certainly have something wrong.
