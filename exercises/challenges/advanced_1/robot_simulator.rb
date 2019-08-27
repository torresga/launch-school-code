# Robot Simulator
#
# A robot factory's test facility needs a program to verify robot movements.
#
# The robots have three possible movements:
#
#     turn right
#     turn left
#     advance
#
# Robots are placed on a hypothetical infinite grid, facing a particular direction (north, east, south, or west) at a set of {x,y} coordinates, e.g., {3,8}, with coordinates increasing to the north and east.
#
# The robot then receives a number of instructions, at which point the testing facility verifies the robot's new position, and in which direction it is pointing.
#
#     The letter-string "RAALAL" means:
#         Turn right
#         Advance twice
#         Turn left
#         Advance once
#         Turn left yet again
#
# Say a robot starts at {7, 3} facing north. Then running this stream of instructions should leave it at {9, 4} facing west.

# I think what the method advance does depends on what direction the robot is facing
#
# coordinates increase to the north and east
# therefore, coordinates decrease to the south and west

# According to the tests we have two classes:
# - Robot
#   - initialize
#       Input: none
#       Output: none
#       Set a @bearing variable to nil
#       Set a @coordinates variable to nil
#   - orient
#       Input: a direction as a symbol
#       Output: none
#       This can set the @bearing variable
#       Raises an ArgumentError if not [:north, :south, :east, or :west]
#   - bearing
#       This can be a reader method
#   - turn_right
#       Input: none
#       Output: mutates @bearing
#       Algorithm:
#       Create new variable new_direction
#       Look at current direction
#         When it's north
#           Assign new_direction to :east
#         When it's east
#           Assign new_direction to :south
#         When it's south
#           Assign new_direction to :west
#         When it's west
#           Assign new_direction to :north
#       Set @bearing to new_direction
#   - turn_left
#       Input: none
#       Output: mutates @bearing
#       Algorithm:
#       Create new variable new_direction
#       Look at current_direction
#         When it's north
#           Assign new direction to :west
#         When it's west
#           Assign new direction to :south
#         When it's south
#           Assign new direction to :east
#         When it's east
#           Assign new direction to :north
#       Set @bearing to new_direction
#   - at
#     Input: two coordinates
#     Output: none
#     Sets @coordinates to an array of coordinates [x, y]
#   - coordinates
#      Attr_reader for @coordinates
#   - advance
#     Input: none
#     Output: none but we mutate coordinates
#     Algorithm
      # if coordinates are x and y
      #   @coordinates.first is x
      #   @coordinates.last is y
      #
      # Look at bearing
      #   When @bearing is :north, we + 1 to @coordinates.last
      #   When @bearing is :south we -1 to @coordinates.last
      #   When @bearing is :east we +1 to @coordinates.first
      #   When @bearing is :west we -1 to @coordinates.first

# - Simulator
#   - instructions
#      Input: A string
#      Output: An array of symbols, each representing a method
#      Algorithm:
#       Create a hash - L => :turn_left, R => :turn_right, A => :advance
#       Split string into an array of characters
#       Map each character of array into a symbol in hash
#   - place
#       Input: robot object, x and y coordinates, and a direction
#       This method looks like it sets up the robot
#   - evaluate
#       Input: robot object, a string of instructions
#       Output: nothing, but it mutates the robot object
#       Algorithm
#       Calls instructions on the string of instructions
#       Loop through the instructions
#         Send each instruction to the robot

class Robot
  attr_reader :bearing, :coordinates

  def initialize
    @bearing = nil
    @coordinates = nil
  end

  def orient(direction)
    raise ArgumentError if ![:north, :south, :east, :west].include?(direction)

    self.bearing = direction
  end

  def turn_right
    new_direction = case bearing
    when :north then :east
    when :east then :south
    when :south then :west
    when :west then :north
    end

    self.bearing = new_direction
  end

  def turn_left
    new_direction = case bearing
    when :north then :west
    when :west then :south
    when :south then :east
    when :east then :north
    end

    self.bearing = new_direction
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    new_coordinates = case bearing
    when :north then [@coordinates.first, @coordinates.last + 1]
    when :south then [@coordinates.first, @coordinates.last - 1]
    when :east then [@coordinates.first + 1, @coordinates.last]
    when :west then [@coordinates.first - 1, @coordinates.last]
    end

    self.coordinates = new_coordinates
  end

  private

  attr_writer :bearing, :coordinates
end

class Simulator
  INSTRUCTIONS = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }

  def instructions(string_of_instructions)
    string_of_instructions.chars.map do |instruction|
      INSTRUCTIONS[instruction]
    end
  end

  def place(robot, x: 0, y: 0, direction: north)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, string_of_instructions)
    array_of_instructions = instructions(string_of_instructions)
    array_of_instructions.each do |instruction|
      robot.public_send(instruction)
    end
  end
end
