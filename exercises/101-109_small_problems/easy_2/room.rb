# PEDAC
# Goal: Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Identify Expected Input or Output
# Make requirements explicit
# Identify rules
# Mental models of problem
#
# Input: Length and Width as Integers
# Output: Area as Float
# Is it safe to assume that both inputs will be positive non-zero integers?
# We have to be mindful of units here - default unit is meters, but then we have to display the area in square feet as well.
#
# Create examples/test cases to validate understanding of problem
#
# Example output:
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).
#
# Data Structures
# Inputs can be entered as Integers, but we can keep them internally as Float
# Outputs can be captured and displayed as a Float
#
# Algorithm
# Given two integers.
# Set area
# Set sq_feet
#
# Calculate area (length X width)
# Assign area to area
# Convert square meters to square feet
# Assign square feet calculation to sq_feet
# Display both square meters and square feet areas.
#
# Code

# puts "Enter the length of the room in meters: "
# length = gets.chomp.to_f
#
# puts "Enter the width of the room in meters:"
# width = gets.chomp.to_f

# area = length * width
# Should put 10.764 in a constant so we don't forget what the number represents.
# sq_feet = area * 10.764

# I used truncate here to keep the calculation to a precision of 2 digits as shown in the example.
# puts "The area of the room is #{area} square meters (#{sq_feet.truncate(2)} square feet)."

# Further Exploration
# Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

SQINCHES = 144
SQCENTIMETERS = 929.03

puts "Enter the length of the room in feet"
length = gets.chomp.to_f

puts "Enter the width of the room in feet"
width = gets.chomp.to_f

area_in_feet = length * width

area_in_sq_inches = area_in_feet * SQINCHES

area_in_sq_centimeters = area_in_feet * SQCENTIMETERS

puts "The area of the room is #{area_in_feet} square feet (#{area_in_sq_inches} square inches and #{area_in_sq_centimeters} sq centimeters)."
