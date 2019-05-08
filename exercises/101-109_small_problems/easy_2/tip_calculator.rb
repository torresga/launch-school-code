# PEDAC
# Goal: Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Identify expected input or Output
# Make requirements explicit
# Identify rules
# Create a mental model of the problem
#
# Input: A bill amount, which is a positive decimal greater or equal to zero. A tip percentage, which is a positive decimal greater or equal to zero.
# Output: A tip amount, which is a positive decimal amount. A total amount, which is a positive decimal amount.

# Create examples/test cases to validate understanding of problem

# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0

# Data Structures
# Input data can be structured as a Float.
# Output data can be structured as a Float.

# Algorithm

# Given two arguments.
#
# Set tip
# Set tip_percentage
# Set total
#
# Assign to tip_percentage the tip amount / 100.0
# Assign to tip the result of tip_percentage x bill amount
# Assign to total the result of tip + bill amount
#
# Display tip
# Display total

# Code

bill_amount = 0
loop do
  puts "What is the bill?"
  bill_amount = gets.to_f

  break if bill_amount.positive?
  puts "Invalid input. Please enter a valid positive number."
end

tip_rate = 0
loop do
  puts "What is the tip percentage?"
  tip_rate = gets.to_f

  break if tip_rate.positive?
  puts "Invalid input. Please enter a valid positive number."
end

tip_percentage = tip_rate / 100.0
tip = tip_percentage * bill_amount
total = tip + bill_amount

# Further Exploration
# Our solution prints the results as $30.0 and $230.0 instead of the more usual $30.00 and $230.00. Modify your solution so it always prints the results with 2 decimal places.

puts "The tip is $#{format("%.2f", tip)}"
puts "The total is $#{format("%.2f", total)}"
