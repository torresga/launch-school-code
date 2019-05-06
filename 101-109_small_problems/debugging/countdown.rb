# Countdown
# Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# Inside of the decrease method, the parameter counter is reassigned to counter - 1, ultimately a different object from counter. Reassignment is not mutating. This is why on line 12, decrease(counter) does not decrease the counter.

# If we reassign counter on line 12 to the return value of decrease(counter) during each block execution, counter will output the correct value. (previous counter value minus 1)

# Note: Solution has 'counter - 1' vs 'counter -= 1', in the latter counter will always be reassigned to a new object and that will be returned since it's the last line of the method, whereas in the former a new object that is the result of 'counter - 1' will be returned. Same effect, subtle difference.

# Further Exploration
# We specify 10 two times, which looks a bit redundant. It should be possible to specify it only once. Can you refactor the code accordingly?

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
