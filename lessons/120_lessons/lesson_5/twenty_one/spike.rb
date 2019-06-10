class Participant
  attr_reader :hand

  def initialize
    @hand = []
    # I guess we can add a name as a state in here
  end

  def hit(deck)
    # Add a new card to hand
    hand << deck.pick_card
  end

  def stay
    # What does stay do?
    # I think it tells next person to go
  end

  def busted?
    # total is greater than 21
  end

  def total
    # This should calculate the total of all the cards in hand
    # If we have one ace in hand
    #   That ace can be replaced with 11
    # If we have two or more aces in hand
    #   Replace the first ace with 11
    #   Replace remaining ace with 1
    # Add together numerical_value for all aces
  end
end

class Player < Participant
end

class Dealer < Participant
  INITIAL_NUMBER_OF_CARDS = 2

  def initialize
    super
    @deck = Deck.new
  end

  def deal(other_person)
    # Hit's self and other person twice
    INITIAL_NUMBER_OF_CARDS.times do
      hit(@deck)
      other_person.hit(@deck)
    end
  end
end

class Deck
  SUITS = %w(Hearts Diamonds Clubs Spades)
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  attr_reader :cards

  # Create 52 cards
  def initialize
    @cards = create_deck.shuffle
  end

  def pick_card
    # Removes one card and returns it
    @cards.shift
  end

  private

  def create_deck
    # Return one long array that's 52 cards long
    SUITS.map do |suit|
      create_suit(suit)
    end.flatten
  end

  def create_suit(suit)
    # Here we are creating an array
    VALUES.map do |value|
      Card.new(suit, value)
    end
  end
end

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{@suit}"
  end

  def numerical_value
    if (2..10).cover?(value.to_i)
      value.to_i
    elsif %w(Jack Queen King).include?(value)
      10
    else
      value
    end
  end

  private

  attr_reader :value
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  private

  def deal_cards
    # Dealer deals cards to self and player
  end

  def show_initial_cards
    # Dealer shows only one card.
    # Player shows both cards
  end

  def player_turn
    # If user is not busted
    #   Decide to hit or stay
    #   If hit, gets one more card from dealer
    #   If stays, then it's dealer's turn
    # Else
    #   set winner to dealer
  end

  def dealer_turn
    # If dealer's total is less than 17
    #   Hit
    # If dealer is busted?
    #  set winner to player
  end

  def show_result
    # Show dealer hand
    # Show player hand
    # declare_winner if there's no winner yet
    # If winner == "tie"
    #   puts "Oh no! It's a tie!"
    # else
    #   puts #{winner} wins the game!
  end

  def declare_winner
    # Compare dealer.hand and player.hand
    #  if dealer.hand > player.hand
    #   set winner to dealer
    # elsif player.hand > dealer.hand
    #   set winner to player
    # else
    #   set winner to "tie"
  end
end

# Game.new.start
pl = Player.new
dealer = Dealer.new
dealer.deal(pl)

p pl.hand
p dealer.hand.first
p dealer.hand.first.numerical_value
