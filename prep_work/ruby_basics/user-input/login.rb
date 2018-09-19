USER = "admin"
PASSWORD = "Sesame"

loop do
  puts ">> Please enter your user name:"
  username_guess = gets.chomp
  puts ">> Please enter your password:"
  password_guess = gets.chomp
  break if username_guess == USER && password_guess == PASSWORD
  puts ">> Authorization failed!"
end

puts "Welcome!"
