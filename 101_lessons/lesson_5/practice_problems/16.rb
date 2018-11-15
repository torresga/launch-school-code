# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.
#
# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.
#
# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
#
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
#
# Write a method that returns one UUID when called with no parameters.
#
# Input: none
# Output: A string, consisting of 32 hexadecimal characters, broken into 5 sections with a -.
#
# What is a hexidecimal number? base 16 - 0 to 9 and a to f
# Each character is a number

# How to create a 32 character string consisting of any characters between 0 and 9 and a and f
# dashes do not count in the 32 character limit

# the 5 sections consisting of 8, 4, 4, 4, 12 values can be represented as an array.
# For each element of that array
#   create a random string element characters long
#   add it to the hex_number array
# Join array of strings together into a string with "-" as a separator

def return_uuid
  hex_chars = ('0'..'9').to_a + ('a'..'f').to_a
  section_lengths = [8, 4, 4, 4, 12]
  full_number = []

  section_lengths.each do |len|
    hex_number = ''
    len.times do
      char = hex_chars.sample
      hex_number << char
    end

    full_number << hex_number
  end

  full_number.join("-")
end
