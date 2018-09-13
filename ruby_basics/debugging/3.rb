def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
# This is not an Integer but a String
# Should be: number = gets.chomp.to_i
number = gets.chomp

# Strings can be multiplied by numbers!!!!!!
puts "The result is #{multiply_by_five(number)}!"
