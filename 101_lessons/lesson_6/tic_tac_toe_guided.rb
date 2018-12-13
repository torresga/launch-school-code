require 'pry'

# Valid options for the constant can be "player", "computer", or "choose".
FIRST_PLAYER = "choose"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
TOTAL_WINS = 5

def choose_first_player
  prompt "Who goes first?"
  prompt "Please enter 'player' or 'computer'"

  player = ""
  loop do
    player = gets.chomp
    break if player == "player" || player == "computer"
  end
  player
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd, scores)
  user_score, computer_score = scores
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  prompt("User score: #{user_score} Computer score: #{computer_score}")
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # binding.pry
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}:")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd, marker)
  almost_full_lines = WINNING_LINES.select do |line|
    brd.values_at(*line).count(marker) == 2
  end

  almost_full_lines.flatten!
  almost_full_lines.select { |elem| brd[elem] == INITIAL_MARKER }.first
end

def computer_places_piece!(brd)
  winning_move = find_at_risk_square(brd, COMPUTER_MARKER)
  defend = find_at_risk_square(brd, PLAYER_MARKER)

  square = if !winning_move.nil?
             winning_move
           elsif !defend.nil?
             defend
           elsif empty_squares(brd).include?(5)
             5
           else
             empty_squares(brd).sample
           end

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player == "player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  player = if player == "player"
             "computer"
           else
             "player"
           end
  player
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(arr, delimeter=',', joining_word='or')
  delimeter.strip!

  if arr.size <= 2
    delimeter = ''
  end

  joined_string = ""
  arr.each do |elem|
    joined_string << if elem == arr.last
                       elem.to_s
                     elsif elem == arr.last - 1
                       "#{elem}#{delimeter} #{joining_word} "
                     else
                       "#{elem}#{delimeter} "
                     end
  end
  joined_string
end

loop do
  user_score = 0
  computer_score = 0
  game_winner = ''
  current_player = FIRST_PLAYER

  if current_player == "choose"
    current_player = choose_first_player
  end

  loop do
    board = initialize_board

    loop do
      display_board(board, [user_score, computer_score])
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, [user_score, computer_score])

    if someone_won?(board)
      winner = detect_winner(board)
      if winner == "Player"
        user_score += 1
      else
        computer_score += 1
      end
    end

    if user_score == TOTAL_WINS
      game_winner = "Player"
      break
    elsif computer_score == TOTAL_WINS
      game_winner = "Computer"
      break
    end
  end

  prompt "#{game_winner} wins the game!"
  prompt "Play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  prompt "Thank you for playing Tic-Tac-Toe! Goodbye!"
end
