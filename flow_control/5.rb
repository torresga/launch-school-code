def compare(number)
 answer = case
  when number >= 0 && number <= 50
    "The number is between 0 and 50."
  when number >= 51 && number <= 100
    "The number is between 51 and 100"
  when number > 100
    "The number is above 100" 
  else
    "Invalid number. Please enter a number between 0 and 100."
  end
  
  answer
end

puts "Please enter a number between 0 and 100"

number = gets.chomp.to_i

puts compare(number) 

