def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil

loop do
  puts "Please enter the numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid input. Only integers are allowed"
end

loop do
  puts "Please enter the denominator:"
  denominator = gets.chomp

  if valid_number?(denominator) == false
    puts "Invalid input. Only integers are allowed."
  elsif denominator.to_i.zero?
    puts "Invalid input. A denominator of zero is not allowed"
  end

  break if valid_number?(denominator) && denominator != "0"
end

puts "#{numerator} / #{denominator} is #{numerator.to_i / denominator.to_i}"
