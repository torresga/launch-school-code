# PEDAC
#
# Goal: Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
#
# Identify expected input or output
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Odd numbers
# including 1 to 99
# each number is on a separate line

# Create examples/test cases

# 1
# 3
# 5
# 7
# 9
# 11
# 13
# 15
# 17
# ...
#
# Data Structures

# Range - to gather numbers from 1 to 99

#
# Algorithms

# Set numbers = numbers from 1 to 99
# For each number in numbers
#   If number % 2 == 1 (basically if number is odd)
#     Print number
#   End If
# End For
#
# Code
# Using .each
(1..99).each { |n| puts n if n.odd? }

# Using a loop
numbers = (1..99).to_a
counter = 0

loop do
  current_number = numbers[counter]

  if current_number % 2 == 1
    puts current_number
  end

  counter += 1
  break if counter == numbers.size
end

# Using Integer#upto
1.upto(99) {|number| puts number if number.odd? }

# Using Array#select
numbers = (1..99).to_a.select {|x| x.odd? }
numbers.each {|x| puts x }
