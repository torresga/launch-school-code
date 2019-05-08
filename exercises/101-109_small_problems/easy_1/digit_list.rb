# PEDAC
# Goal: Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Identify Expected Input or Output.
# Expected input: one positive integer
# Expected output: a list of the digits in the number

# Make requirements explicit
# - one argument
# - argument is a positive integer (greater than zero)
# -returns a list

# Identify rules
# Mental models of problem

# Create examples/test cases
# puts digit_list(12345) => [1, 2, 3, 4, 5]
# puts digit_list(7) => [7]
# puts digit_list(375290) => [3, 7, 5, 2, 9, 0]
# puts digit_list(444) => [4, 4, 4]

# Determine data structures
# input -> integer
# inside the method, the number can be converted to a string,
# which can be converted into an array
# output -> array

# Create algorithm
# Given a positive number,
# Convert number to a string.
# Create a new array string_list.
# Convert string into an array and assign it to string_list.
# Create a new array digit_list.
# Iterate over string_list
# For each digit in string_list
#   Convert digit to an Integer
#   Add Integer digit to digit_list
# End
# Return string_list

# Implement algorithm

def digit_list(number)
  number = number.to_s
  numbers_as_strings = number.split("")
  digit_list = []

  numbers_as_strings.each do |digit|
    digit_list << digit.to_i
  end

  digit_list
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# Further exploration
# Find where your Ruby stores Gems, and search the Gems you have installed for uses of the &:method_name construction. See if you can figure out what is going on at that point in the code.
