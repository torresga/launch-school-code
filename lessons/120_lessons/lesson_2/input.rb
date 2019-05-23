module Input
  def get_input(messages, choices)
    input = nil
    loop do
      puts messages.first
      input = gets.chomp
      break if choices.include? input.downcase
      puts messages.last
    end

    input
  end
end
