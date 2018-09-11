def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

number1 = nil
number2 = nil

loop do
  loop do
    puts "Please enter a positive or negative integer:"
    number1 = gets.chomp
    break if valid_number?(number1)
    puts "Invalid input. Only non-zero integers are allowed."
  end

  loop do
    puts "Please enter a positive or negative integer:"
    number2 = gets.chomp
    break if valid_number?(number2)
    puts "Invalid input. Only non-zero integers are allowed."
  end

  if (number1.to_i.positive? && number2.to_i.negative?) || (number1.to_i.negative? && number2.to_i.positive?)
    break
  else
    puts "Sorry. One integer must be positive, another must be negative."
    puts "Please start over."
  end
end

puts "#{number1} + #{number2} = #{number1.to_i + number2.to_i}"
