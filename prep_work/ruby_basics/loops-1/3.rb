iterations = 1

loop do
  if iterations > 5
    break
  else
    puts "Number of iterations = #{iterations}"
    iterations += 1
  end
end

# For this code:
# iterations = 1
#
# loop do
#   puts "Number of iterations = #{iterations}"
#   break if iterations > 5
#   iterations += 1
# end

# This loop runs 6 times before the if condition in the break statement is true.
# To make it run only 5 times, the condition needs to be if iterations == 5
