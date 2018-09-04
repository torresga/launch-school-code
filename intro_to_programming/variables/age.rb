puts "How old are you?"
age = gets.chomp.to_i
puts "In 10 years you will be #{age + 10}"
puts "In 20 years you will be #{age + 20}"
puts "In 30 years you will be #{age + 30}"
puts "In 40 years you will be #{age + 40}"

# Another way
# puts "In 10 years you will be " + (age + 10).to_s
# puts "In 20 years you will be " + (age + 20).to_s
# puts "In 10 years you will be " + (age + 30).to_s
# puts "In 40 years you will be " + (age + 40).to_s
