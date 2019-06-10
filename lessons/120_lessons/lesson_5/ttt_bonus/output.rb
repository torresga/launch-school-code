module Output
  # Helper methods

  def joinor(arr, delimeter = ', ', joining_word = 'or')
    return arr.join(" #{joining_word} ") if arr.length <= 2

    arr.map.with_index do |element, index|
      index == arr.length - 1 ? "#{joining_word} #{element}" : element.to_s
    end.join(delimeter)
  end

  # Display methods

  def display_result(winner)
    clear_screen_and_display_board

    if winner
      puts "#{winner.name} won!"
    else
      puts "It's a tie!"
    end

    display_score
  end

  def display_score
    puts "#{human.name}'s score: #{human.score}"
    puts "#{computer.name}'s score: #{computer.score}"
    puts ''
  end

  def display_final_score(winner)
    puts "#{winner} won the round!"
    puts ''
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def display_welcome_message
    clear
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_board
    puts "#{human.name} is a #{human.marker}."
    puts "#{computer.name} is a #{computer.marker}."

    puts ''
    board.draw
    puts ''
  end
end
