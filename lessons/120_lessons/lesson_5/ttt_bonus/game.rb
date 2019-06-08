require 'pry'
require './board'
require './human'
require './computer'
require './square'
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
    clear
    display_welcome_message
    set_human_name
    # binding.pry

    loop do
      pick_first_to_move
      set_markers
      # binding.pry

      loop do
        display_board

        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          switch_player
          # human_turn? ? clear_screen_and_display_board : display_board
          display_board
          # binding.pry
        end

        update_score
        display_result
        break if round_won?
        display_play_again_message
        reset_game
        # binding.pry
      end

      display_final_score
      break unless play_again?
      reset_round
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def set_markers
    if human.first_to_move?
      human_marker = human.choose_marker
      computer_marker = human.get_other_marker(human_marker)
    else
      computer_marker = computer.choose_marker
      human_marker = computer.get_other_marker(computer_marker)
    end

    human.marker = human_marker
    computer.marker = computer_marker
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

  def set_human_name
    human.set_name
  end

  def current_player_moves
    square = current_player.choose_square(board)
    board[square] = current_player.marker
  end

  # switch player
  def switch_player
    @current_player = current_player.is_a?(Human) ? computer : human
  end

  def update_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer.marker
      computer.score += 1
    end
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

game = TTTGame.new
game.play
