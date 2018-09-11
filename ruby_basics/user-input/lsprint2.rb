loop do
  puts "How many output lines do you want? Enter a number >= 3 (Or Q to quit)"
  answer = gets.chomp
  break if answer.downcase == 'q'
  number = answer.to_i

  if number >= 3
    number.times { puts "Launch School is the best!" }
  else
    puts "That's not enough lines."
  end
end
