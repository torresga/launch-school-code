numbers = []

loop do
  if numbers.size == 5
    break
  else
    puts 'Enter any number:'
    input = gets.chomp.to_i
    numbers.push(input)
  end
end

puts numbers
