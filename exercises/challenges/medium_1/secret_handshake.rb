# Secret Handshake
#
# Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.
#
# There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".
#
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
#
#
# 10000 = Reverse the order of the operations in the secret handshake.
#
# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]
#
# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]
#
# The program should consider strings specifying an invalid binary as the value 0.

# Input: Can either take an integer or a string that represents a binary number
# Output: An array of commands (strings)

# Input can either be an integer or a string that represents a binary number
# We don't have to try to convert integer to binary ourselves, we can use the method to_s(2) on an Integer.

# Then we can convert from string to integer.
# How if we break up the integer into an array of digits.
# Then we can multiply integer times index number of 10s

# Data Structure
# Hash to map number to word?

# Algorithm

# 1. Convert input to binary
# 2. Break up the binary integer into digits
# 3. Map the digits to an operation
# 4. Select the digits that have an operation
# 5. If array has a 10000, remove the element and reverse the array
# 6. Return array

# 1. Convert input
#   If input is an integer,
#     Turn it to a string
#   Else if the input is a string that has letters
#     Input is "0"
#
#   Convert input to binary

# 2. Break up the binary integer into digits
# Can use to_i and digits on this
# Loop through digits with index
#   Multiply digit times 10**index

# 3. Map the digits to an operation
# Loop through digits
#   If current digit is in the hash
#     map digit to string
#   Else keep digit the same

# 4. Reject elements that are zeroes

# 5. If array has a 10000, remove the element and reverse the array
# 6. Return array

# Code

class SecretHandshake
  attr_reader :binary

  # COMMANDS = {
  #   1 => "wink",
  #   10 => "double blink",
  #   100 => "close your eyes",
  #   1000 => "jump"
  # }
  #
  # REVERSE = 10000

  COMMANDS = ["wink", "double blink", "close your eyes", "jump", "reverse"]

  def initialize(number)
    @number = number
    @binary = to_binary(@number)
  end

  def commands
    return [] if @binary.zero?

    # digits = to_digits
    #
    # if digits.include?(REVERSE)
    #   digits.pop
    #   digits.reverse!
    # end
    #
    # digits.map do |number|
    #   COMMANDS.keys.include?(number) ? COMMANDS[number] : nil
    # end.reject do |number|
    #   number == nil
    # end

    mapped_commands = @binary.digits
           .map
           .with_index do |digit, index|
              COMMANDS[index] if digit == 1
           end.reject do |elem|
             elem.nil?
           end

    mapped_commands.include?("reverse") ? mapped_commands.reverse[1..-1] : mapped_commands
  end

  private

  def to_binary(input)
    if input.is_a?(Integer)
      input.to_s(2).to_i
    elsif input.match?(/[a-z2-9]/i)
      0
    else
      input.to_i
    end
  end

  # def to_digits
  #   binary.digits.map.with_index do |digit, index|
  #     digit * 10**index
  #   end
  # end
end
