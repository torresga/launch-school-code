# From-To-Step Sequence Generator
#
# The Range#step method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.
#
# Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.
#
# Example:

# step(1, 10, 3) { |value| puts "value = #{value}" }
#
# value = 1
# value = 4
# value = 7
# value = 10

# What do you think would be a good return value for this method, and why?
# Maybe nil? This is tricky because a method normally returns the type of object on which it is called. What is the object in this case?

# Create a counter and assign it to start number
# Loop
#   yield counter to block
#   increment counter by step
#   break if counter is > end number

def step(start_number, end_number, step)
  counter = start_number

  loop do
    yield(counter)
    break if counter + step > end_number
    counter += step
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# Output:
# value = 1
# value = 4
# value = 7
# value = 10
