# Bannerizer
# Write a method that will take a short line of text, and print it within a box.

# Input: A string
# Output: A string
# Mental model: Given a string, create a new string containing the input string surrounded by a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# Data Structure
# Input and output can remain strings.

# Algorithm
# Get input string
# Get input string length
# Output top side of box: + plus - * string.length + 2 plus +
# Output top padding of box: | plus " " * string.length + 2 plus |
# Output middle of box: | plus " " + quote plus " " plus |
# Output bottom padding of box: | plus " " * string.length + 2 plus |
# Output bottom side of box: + plus - * string.length + 2 plus +

# Code
def print_in_box(str)
  str_length = str.length
  edge_of_box = "+" + ("-" * (str_length + 2)) + "+"
  box_padding = "|" + (" " * (str_length + 2)) + "|"
  box_quote = "|" + " " + str + " " + "|"

  # puts edge_of_box
  # puts box_padding
  # puts box_quote
  # puts box_padding
  # puts edge_of_box

  [edge_of_box, box_padding, box_quote, box_padding, edge_of_box].each do |line|
    puts line
  end
end

 print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
# Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.
