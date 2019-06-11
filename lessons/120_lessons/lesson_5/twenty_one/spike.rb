# This is the superclass for Player and Dealer
class Participant
  TOTAL = 21
  attr_reader :hand, :name

  def initialize
    @hand = []
    @name = ''
  end

  def hit(deck)
    # Add a new card to hand
    hand << deck.pick_card
  end

  def busted?
    # total is greater than 21
    total > 21
  end

  def total
    all_cards_total = hand.map(&:numerical_value).sum

    ace_count.times do
      all_cards_total -= 10 if all_cards_total > TOTAL
    end

    all_cards_total
  end

  private

  def ace_count
    hand.select(&:ace?).count
  end
end

# This is the class for Player.
class Player < Participant
  def initialize
    super
    @name = user_input_name
  end

  def user_input_name
    name = nil
    loop do
      print 'What is your name? '
      name = gets.chomp
      break unless name.strip.length.zero?
      puts 'Sorry, please enter a name.'
    end
    name
  end

  def choose
    answer = nil
    loop do
      print 'Will you (h)it or (s)tay? '
      answer = gets.chomp
      break if %w(h hit s stay).include?(answer)
      puts 'Please input a valid answer.'
    end
    answer
  end
end

# This is the class for Dealer.
class Dealer < Participant
  attr_reader :deck
  INITIAL_NUMBER_OF_CARDS = 2
  STAY_TOTAL = 17

  def initialize
    super
    @deck = Deck.new
    @name = 'Dealer'
  end

  def deal(other_person)
    INITIAL_NUMBER_OF_CARDS.times do
      other_person.hit(@deck)
    end
  end

  def stay
    total > STAY_TOTAL
  end
end

# This is the class for Deck.
class Deck
  SUITS = %w(Hearts Diamonds Clubs Spades).freeze
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
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

# This is the class for Card.
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
      11
    end
  end

  def ace?
    value == 'Ace'
  end

  private

  attr_reader :value
end

# This is the class for Game.
class Game
  NUMBER_OF_DASHES = 21
  attr_reader :player, :dealer

  def initialize
    # Create player and dealer objects in here
    @player = Player.new
    @dealer = Dealer.new
    @winner = nil
  end

  def start
    display_welcome_message
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
    display_goodbye_message
  end

  private

  attr_accessor :winner

  def deal_cards
    display_card_dealing_text
    # Dealer deals cards to self and player
    dealer.deal(player)
    dealer.deal(dealer)
  end

  def show_initial_cards
    # Dealer shows only one card.
    puts '-' * NUMBER_OF_DASHES
    puts "Dealer's cards:"
    puts "[#{dealer.hand.sample}]"
    # Player shows both cards
    puts '-' * NUMBER_OF_DASHES
    show_hand(player)
    puts '-' * NUMBER_OF_DASHES
  end

  def player_turn
    loop do
      answer = player.choose
      break if %w(s stay).include?(answer)

      player_hit
      break if player.busted?
    end

    display_busted_message(player) if player.busted?
  end

  def dealer_turn
    return if player.busted?

    loop do
      dealer.hit(dealer.deck)
      break if dealer.stay || dealer.busted?
    end

    display_busted_message(dealer) if dealer.busted?
  end

  def show_result
    puts ''
    puts '-' * NUMBER_OF_DASHES
    puts 'Results of this hand:'
    puts '-' * NUMBER_OF_DASHES
    show_hand(dealer)
    show_hand(player)
    decide_winner
    display_winning_text
  end

  def display_busted_message(player)
    puts ''
    puts "Oh no! #{player.name} busted!"
  end

  def decide_winner
    winner =
      if player.total == dealer.total
        'tie'
      elsif player.busted?
        dealer
      elsif dealer.busted?
        player
      elsif won?(player, dealer)
        player
      elsif won?(dealer, player)
        dealer
      end

    self.winner = winner
  end

  def won?(first, second)
    first.total > second.total
  end

  def player_hit
    player.hit(dealer.deck)
    show_hand(player)
  end

  def show_hand(user)
    puts ''
    puts "#{user.name}'s cards:"
    puts "[#{user.hand.join(', ')}]"
    puts "#{user.name} total: #{user.total}"
    puts ''
  end

  def display_winning_text
    if winner == 'tie'
      puts "Oh no! It's a tie!"
    else
      puts "#{winner.name} wins the game!"
    end
  end

  def display_welcome_message
    puts '-' * (NUMBER_OF_DASHES * 2)
    puts 'Welcome to Twenty One!'
    puts '-' * (NUMBER_OF_DASHES * 2)
  end

  def display_goodbye_message
    puts 'Thanks for playing Twenty One! Goodbye!'
  end

  def display_card_dealing_text
    puts "Let's deal some cards!"
    puts ''
  end
end

Game.new.start
