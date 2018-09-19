def categorize_number(number)
  answer = case
  when number >= 0 && number <= 50
    "#{number} is between 0 and 50"
  when number >= 51 && number <= 100
    "#{number} is between 51 and 100"
  when number > 100
    "#{number} is greater than 100"
  else
    "I don't know what to do with that"
  end
  answer
end

puts "Give me a number"
number = gets.chomp.to_i

puts categorize_number(number)
