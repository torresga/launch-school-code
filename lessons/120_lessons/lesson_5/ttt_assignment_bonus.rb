class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
  end
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :score

  def initialize
    @marker = ""
    @score = 0
  end

  def reset
    self.score = 0
    self.marker = ""
  end
end

# This is the game engine
class TTTGame
  X = 'X'
  O = 'O'

  attr_reader :board, :human, :computer
  attr_writer :current_marker

  attr_accessor :first_to_move, :current_marker

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @first_to_move = ""
    @current_marker = ""
  end

  def play
    clear
    display_welcome_message

    loop do
      set_markers

      loop do
        display_board

        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
        end

        update_score
        display_result
        break if round_won?
        display_play_again_message
        reset_board
      end

      display_final_score
      break unless play_again?
      reset_all
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}"

    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def set_markers
    marker_choices = [X, O]
    puts "Choose a marker: #{marker_choices.join(" or ")}"
    human_marker = nil
    computer_marker = nil
    loop do
      human_marker = gets.chomp
      break if marker_choices.include?(human_marker)
      puts "Sorry, that's not a valid choice."
    end

    if human_marker == X
      computer_marker = O
    else
      computer_marker = X
    end

    human.marker = human_marker
    computer.marker = computer_marker

    self.first_to_move = human.marker
    self.current_marker = human.marker
  end

  def joinor(arr, delimeter = ", ", joining_word = "or")
    return arr.join(" #{joining_word} ") if arr.length <= 2

    joined_string = ""

    arr.each_with_index do |element, index|
      joined_string << "#{element}"
      joined_string << "#{delimeter}" if index != arr.length-1
      joined_string << "#{joining_word} " if index == arr.length-2
    end

    joined_string
  end

  def human_moves
    puts "Choose a square: #{joinor(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end

    display_score
  end

  def update_score
    case board.winning_marker
    when human.marker
      human.score += 1
    when computer.marker
      computer.score += 1
    end
  end

  def display_score
    puts "Human score: #{human.score}"
    puts "Computer score: #{computer.score}"
  end

  def display_final_score
    winner = case
    when human.score == 5
      'Human'
    when computer.score == 5
      'Computer'
    end

    puts "#{winner} won the round!"
    puts ''
  end

  def round_won?
    human.score == 5 || computer.score == 5
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

  def reset_board
    board.reset
    @current_marker = @first_to_move
  end

  def reset_players
    human.reset
    computer.reset
  end

  def reset_all
    reset_board
    reset_players
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end
end

game = TTTGame.new
game.play
