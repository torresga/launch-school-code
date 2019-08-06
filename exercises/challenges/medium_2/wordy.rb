# Wordy
#
# Write a program that takes a word problem and returns the answer as an integer.
#
# E.g.
#
#     What is 5 plus 13?
#
# The program should return 18.
#
#     What is 7 minus 5 minus 1?
#
# The program should return 1.
#
# Remember, that these are verbal word problems, not treated as you normally would treat a written problem. This means that you calculate as you move forward each step. This means 3 + 2 * 3 = 15, not 9.
#
# Hint: to solve this problem elegantly, you need to know how the send method works in Ruby. If you haven't seen it before, check it out here.

# class called WordProblem
#   - initialize
#     - Input: A string
#     - Output: None
#     - Stores the question inside an instance variable. We can probably strip the "What is" and "?" parts here and split to an array
#   - answer
#     - Input: None
#     - Output: An integer
#     - Returns an answer represented by an integer, which can be positive or integer

# Three ideas:
# - Work with two arrays: Separate values from operations
# - A nested array - Each array has three elements and looks like: [[[3, '+', 3], '*', 2], '/', 3]
# - Take one slice - first slice is the first three elements of array. Then Loop through the rest of the array and take the next two elements.

class WordProblem
  OPERATIONS = {
    'plus' => '+',
    'minus'=> '-',
    'multiplied' => '*',
    'divided' => '/'
  }

  def initialize(problem)
    @problem = map(strip(problem))
  end

  def answer
    calculation = @problem.shift.send(@problem.shift, @problem.shift)

    until @problem.empty?
      calculation = calculation.send(@problem.shift, @problem.shift)
    end

    calculation
  end

  def strip(problem)
    raise ArgumentError if !problem.match?(/^what/i)

    problem.gsub(/what|is|by|[.,?!]/i, '')
           .strip
           .squeeze(' ')
           .split(" ")
           .map { |element| element.to_i.to_s == element ? element.to_i : element }
  end

  def map(problem)
    problem.map do |element|
      raise ArgumentError if element.to_i.to_s == "0" && !OPERATIONS.key?(element)
      
      OPERATIONS.key?(element) ? OPERATIONS[element] : element
    end
  end
end
