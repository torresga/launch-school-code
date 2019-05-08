# PEDAC
#
# Goal: Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
#
# Identify expected input or output
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Even numbers
# Numbers from 1 to 99, including 1 to 99.
# Each number is on a separate line

# Create examples/test cases
# 2
# 4
# 6
# 8
# 10
# 12
# 14
# 16
# 18
# 20
# ...

# Data Structures
# We can use an array to hold the numbers from 1 to 99 if we loop over them
# Alternatively we can use an integer, and call a method on it.
# We don't even need an array, we can have a counter variable that increases on every iteration.

# Algorithms

# Set numbers = a range of numbers between 1 and 99
# For number in numbers
#   If number is even?
#     Print number
#   End If
# End For

# Code
# Using times
99.times do |n|
  puts n if n.even? && n.nonzero?
end

# Using for loop
for num in (1..99)
  puts num if num.even?
end

# Using do while loop
count = 1
loop do
  puts count if count.even?
  count += 1
  break if count == 99
end

# Using until
count = 1
until count == 99
  puts count if count.even?
  count += 1
end
