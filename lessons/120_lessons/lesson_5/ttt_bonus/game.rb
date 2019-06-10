require 'pry'
require './board'
require './human'
require './computer'
require './output'

# This is the game engine
class TTTGame
  include Output
  ROUNDS_PER_GAME = 5
  attr_reader :board, :human, :computer, :players, :current_player

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @players = [@human, @computer]
    @current_player = nil
  end

  def play
    display_welcome_message

    loop do
      pick_first_to_move
      set_markers
      play_round
      break unless play_again?
      reset_round
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def play_game
    loop do
      display_board if human_turn?
      current_player_moves
      break if board.someone_won? || board.full?
      clear if human_turn?
      switch_player
    end

    update_score(winner)
    display_result(winner)
  end

  def play_round
    loop do
      play_game

      break if round_won?
      display_play_again_message
      reset_game
    end

    display_final_score(round_winner)
  end

  def set_markers
    if human.first_to_move?
      human.marker = human.choose_marker
      computer.marker = human.other_marker
    else
      computer.marker = computer.choose_marker
      human.marker = computer.other_marker
    end
  end

  def pick_first_to_move
    puts 'Who should move first?'
    puts "Choose either #{players.join(' or ')}"
    player = nil
    loop do
      player_name = gets.chomp
      player = players.select { |current| current.name == player_name }.first
      break if players.include?(player)
      puts 'Sorry. Please enter a valid player.'
    end

    player.first_to_move = true
    @current_player = player
  end

  def current_player_moves
    square = current_player.choose_square(board)
    board[square] = current_player.marker
  end

  def human_turn?
    @current_player == human
  end

  def switch_player
    @current_player = current_player.is_a?(Human) ? computer : human
  end

  def update_score(winner)
    winner.score += 1 unless winner.nil?
  end

  def round_won?
    human.score == ROUNDS_PER_GAME || computer.score == ROUNDS_PER_GAME
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def round_winner
    if human.score == ROUNDS_PER_GAME
      human.name
    elsif computer.score == ROUNDS_PER_GAME
      computer.name
    end
  end

  def winner
    if board.winning_marker == human.marker
      human
    elsif board.winning_marker == computer.marker
      computer
    end
  end

  # Reset methods

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def reset_board
    board.reset
  end

  def reset_current_player
    @current_player = players.select(&:first_to_move?).first
  end

  def reset_players
    human.reset
    computer.reset
  end

  def reset_game
    reset_board
    reset_current_player
  end

  def reset_round
    reset_board
    reset_players
    clear
  end
end

TTTGame.new.play
