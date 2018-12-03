# PEDAC
# Goal: Create a tic tac toe game.

# Identify expected input or Output
# Make requirements explicit
# Identify rules
# Create a mental model of the problem
#
# Input:
# Output:
# Make requirements explicit

# What mark are we using? Does X go first?

# what does mark a square mean?
# will the way that the user and the computer mark a square be different?
# will input the same information differently?

# How should we ask the user for coordinates?
# Let's ask the user for coordinates one by one, using normal index ordering to minimize confusion (for me at least)

# How do we make sure that computer doesn't mark the same square the user already marked?

# How should the computer get its' coordinates?
# Two ways I can think of - one, picking random coordinates, excluding the ones that user already picked
# Picking around the user's coordinates
# Or way to combine both ideas? take one of user's coordinates and use that for one of computer's coordinates.

# Data Structures
# board: since the board is 3x3, i think this lends well to be a nested array

# Algorithm
# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

# Code

require 'pry'

def display_board(board)
  board.each do |row|
    p row
  end
end

def update_board(board, mark, current_coords, used_coords)
  first_coord, second_coord = current_coords
  board[first_coord][second_coord] = mark
  used_coords.push([first_coord, second_coord])
end

def coords_used?(current_coords, used_coords)
  used_coords.any? { |coords| coords == current_coords }
end

def computer_pick_coords(used_coords)
  possible_values = [0, 1, 2]

  computer_first_coord = 0
  computer_second_coord = 0
  computer_coords = []

  loop do
    computer_first_coord = possible_values.sample
    computer_second_coord = possible_values.sample
    computer_coords = [computer_first_coord, computer_second_coord]

    break if coords_used?(computer_coords, used_coords) == false
  end

  computer_coords
end

def is_winner?(board, mark)
  winner = case
  when board.any? { |row| row.all?(mark) }
      true
    when board.all? { |row| row[0] == mark }
      true
    when board.all? { |row| row[1] == mark }
      true
    when board.all? { |row| row[2] == mark }
      true
    when board[0][0] == mark && board[1][1] == mark && board[2][2] == mark
      true
    else
      false
    end
  winner
end

def is_full?(board)
  board.all? do |row|
    row.all? do |elem|
      elem == "X" || elem == "O"
    end
  end
end


loop do
  board = [["", "", ""], ["", "", ""], ["", "", ""]]
  final_winner = ""
  used_coords = []

  loop do
    puts "Here's our board:"
    display_board(board)

    puts "Enter first coordinate (0 for top row, 1 for middle row, 2 for bottom row)"
    first_coord = gets.to_i

    puts "Enter second coordinate (0 for first element, 1 for second element, 2 for third element)"
    second_coord = gets.to_i

    # User gets to go first to mark the board
    user_mark = "X"
    user_coords = [first_coord, second_coord]
    update_board(board, user_mark, user_coords, used_coords) if coords_used?(user_coords, used_coords) == false

    # Computer then gets to mark the board.
    computer_mark = "O"
    comp_coords = computer_pick_coords(used_coords)

    puts "Computer's first coordinate: #{comp_coords.first}"
    puts "Computer's second coordinate: #{comp_coords.last}"

    update_board(board, computer_mark, comp_coords, used_coords)

    # break if someone is a winner or board is full
    if is_winner?(board, user_mark)
      final_winner = "User"
      break
    elsif is_winner?(board, computer_mark)
      final_winner = "Computer"
      break
    elsif is_full?(board)
      final_winner = "Tie"
      break
    end
  end

  # 5. If winner, display winner.
  # 6. If board is full, display tie.
  puts "#{final_winner} wins the game!"

# break if we don't want to play again
  puts "Want to play again? Press 'y'"
  play_again = gets.chomp

  if play_again == "n"
    puts "Good bye!"
    break
  end

end
