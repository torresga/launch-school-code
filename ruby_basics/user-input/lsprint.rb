puts "How many output lines do you want? Enter a number >= 3"
answer = gets.to_i

if answer >= 3
  number = answer
else
  number = 3
end

number.times do
  puts "Launch School is the best!"
end
