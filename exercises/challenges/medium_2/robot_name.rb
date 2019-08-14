# Robot Name
#
# Write a program that manages robot factory settings.
#
# When robots come off the factory floor, they have no name.The first time you boot them up, a random name is generated, such as RX837 or BC811.
#
# Every once in a while we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.
#
# The names must be random: they should not follow a predictable sequence. Random names means a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

# Robot:
#   Initialize:
#     Creates @name variable and assigns it to random name
#   Name
#     Returns @name
#   Reset
#     Resets name to a different random name

# private method random_name
# Outputs a random name
# Name format:
# Has a length 5
# First Two are random letters
# Last three are random number

# Seed random number thing with a random number from 1000 to 9999
# until number is less than 100
# Generate random number

# Generate two random numbers
# Get character code for each number
#
# Concat characters + number together

class Robot
  attr_reader :name

  def initialize
    @name = reset
  end

  def reset
    @name = generate_name
  end

  private

  def generate_name
    srand Random.new_seed

    number_part = rand(100...1000)

    char1 = rand(65..90).chr
    char2 = rand(65..90).chr

    char1 + char2 + number_part.to_s
  end
end
