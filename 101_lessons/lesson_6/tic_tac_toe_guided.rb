require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
TOTAL_WINS = 5

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

def get_user_move(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}:")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  square
end

def player_places_piece!(brd, used_sqrs)
  square = get_user_move(brd)
  brd[square] = PLAYER_MARKER
  used_sqrs.push(square)
end

def computer_defense_moves(brd, used_sqrs)
  # This works only if there's two of the player pieces in a row.
  # And on the first iteration, almost full_lines returns an empty array

  # get user move
  # find the square closest to it, by picking from a list of closest_coordinates
  user_square = used_sqrs.last
  computer_square = 0
  loop do
    close_coordinates = [1, -1, 3, -3, 4, -4]
    computer_square = user_square + close_coordinates.sample
    break if computer_square > 0 && computer_square < 10
  end
  # Add another loop - computer square also has to be empty
  computer_square
end

  # find the key that holds the x,
  # player_moves = brd.select { |_, v| v == PLAYER_MARKER }.keys

  # if player_moves => [1]
  # We should get => [2, 4, 5]
  # if player_moves => [1, 2]
  # We should get => [3]



  # search in WINNING_LINES for that number,
  # and return a flattened array of all arrays that have that number.
  # almost_full_lines = WINNING_LINES.select do |line|
  #   brd.values_at(*line).count(PLAYER_MARKER) == 2
  # end
  #
  # almost_full_lines.flatten!
  # almost_full_lines.select {|elem| brd[elem] == INITIAL_MARKER }


def computer_places_piece!(brd, used_sqrs)
  # this returns nil when computer_defense_moves is an empty array
  square = computer_defense_moves(brd, used_sqrs)
  brd[square] = COMPUTER_MARKER
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
    if elem == arr.last
      joined_string << "#{elem}"
    elsif elem == arr.last-1
      joined_string << "#{elem}#{delimeter} #{joining_word} "
    else
      joined_string << "#{elem}#{delimeter} "
    end
  end
  joined_string
end

loop do
  user_score = 0
  computer_score = 0
  game_winner = ''
  used_squares = []

loop do
  board = initialize_board

  loop do
    display_board(board, [user_score, computer_score])

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
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
