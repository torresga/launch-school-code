# puts ">> Do you want me to print something? (y/n)"
# answer = gets.chomp.downcase
#
# while answer
#   if answer == "y"
#     puts "something"
#     break
#   elsif answer == "n"
#     puts ""
#     break
#   end
#
#   puts "Invalid input! Please type y or n"
#
#   puts ">> Do you want me to print something? (y/n)"
#   answer = gets.chomp.downcase
# end


loop do
  puts ">> Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase

  if answer == "y"
    puts "something"
    break
  elsif answer == "n"
    puts ""
    break
  end

  puts "Invalid input! Please type y or n"
end
