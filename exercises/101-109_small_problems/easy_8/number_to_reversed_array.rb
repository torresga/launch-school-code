# Convert number to reversed array of digits
# Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

# Input: A positive integer
# Output: A positive integer
# Mental model: Given a positive integer, reverse the digits and return the new number.

# Examples:

# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1
# Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

# Data Structures
# Inputs and outputs are integers. We can split digits into an array.

# Algorithm
# Create a counter
# Create a new number
# Split number into digits
# Reverse digits
# Loop over digits
#   Add to number current digit * counter
#   Multiply counter by 10

# Return number

# Code
def reversed_number(int)
  counter = 1
  reversed = 0

  digits = int.digits.reverse

  digits.each do |num|
    reversed += (num * counter)
    counter *= 10
  end
  reversed
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
