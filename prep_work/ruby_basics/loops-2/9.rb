require 'pry'

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  next if number_a < 5 || number_b < 5

  break puts "5 was reached!"

end

# Further exploration question:
# Is using next the best option for this example? Could you use an if/else statement instead?
# Using next in this example is confusing.
# Much easier example:

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#
#   if number_a == 5 || number_b == 5
#     puts "5 was reached!"
#     break
#   end
# end
