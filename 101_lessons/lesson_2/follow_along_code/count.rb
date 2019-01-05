require "pry"

counter = 0

loop do
  counter += 1
  # Use CTRL-D to go to next loop, or exit-program to exit program
  binding.pry
  break if counter == 5
end
