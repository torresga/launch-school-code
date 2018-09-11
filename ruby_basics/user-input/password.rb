PASSWORD = "Sesame"

loop do
  puts ">> Please enter your password:"
  guess = gets.chomp
  break if guess == PASSWORD
  puts ">> Invalid password!"
end

puts "Welcome!"
