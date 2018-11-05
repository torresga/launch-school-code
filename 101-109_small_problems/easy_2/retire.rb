# PEDAC
# Goal: Build a program that displays when the user will retire and how many years she has to work till retirement.

# Identify expected input or Output
# Make requirements explicit
# Identify rules
# Create a mental model of the problem
#
# Input: An age, represented by a positive integer greater than 0. A desired retirement age, represented by a positive integer greater than or equal to 0.
# Output: The current year, the retirement year, and the amount of years left to work, all represented by positive integers.

# Create examples/test cases to validate understanding of problem

# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# Data Structures

# All data can be represented by Integers. I imagine current year can be gotten with the Date class in the standard library, so we don't have to hardcode a year.

# Algorithm

# Given two positive integer inputs.
#
# Set current_year
# Set retirement_year
# Set working_years
#
# Assign to current_year the current year
# Assign to working_years the result of retirement age - current age
# Assign to retirement_year the result of current_year + working_years
#
# Display current_year
# Display retirement_year
# Display working_years

# Code

# We can also use the Time class which is in the Ruby core library.
require 'date'

puts "What is your age?"
age = gets.to_i

puts "At what age would you like to retire?"
retirement_age = gets.to_i

current_year = Date.today.year
working_years = retirement_age - age
retirement_year = current_year + working_years

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{working_years} of work to go!"
