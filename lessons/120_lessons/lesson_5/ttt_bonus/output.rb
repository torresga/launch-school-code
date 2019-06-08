module Output
  # Helper methods

  def joinor(arr, delimeter = ', ', joining_word = 'or')
    return arr.join(" #{joining_word} ") if arr.length <= 2

    joined_string = ''

    arr.each_with_index do |element, index|
      joined_string << element.to_s
      joined_string << delimeter.to_s if index != arr.length - 1
      joined_string << "#{joining_word} " if index == arr.length - 2
    end

    joined_string
  end

  # Display methods

  def display_result
    # clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end

    display_score
  end

  def display_score
    puts "#{human.name}'s score: #{human.score}"
    puts "#{computer.name}'s score: #{computer.score}"
  end

  def display_final_score
    winner =
      if human.score == ROUNDS_PER_GAME
        human.name
      elsif computer.score == ROUNDS_PER_GAME
        computer.name
      end

    puts "#{winner} won the round!"
    puts ''
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def display_welcome_message
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
