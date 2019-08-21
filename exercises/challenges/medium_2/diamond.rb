# Diamond
#
# The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.
# Requirements
#
#     The first row contains one 'A'.
#     The last row contains one 'A'.
#     All rows, except the first and last, have exactly two identical letters.
#     The diamond is horizontally symmetric.
#     The diamond is vertically symmetric.
#     The diamond has a square shape (width equals height).
#     The letters form a diamond shape.
#     The top half has the letters in ascending order.
#     The bottom half has the letters in descending order.
#     The four corners (containing the spaces) are triangles.

# One class method, make_diamond

# make_diamond:
#   Input: A letter
#   Output: A diamond that has the input letter in the center (its widest point)

# Spacing is 2x the position in the alphabet. For example, A is the first letter. Length of "A\n" including spacing is 2.
# Widest point is going to not have spaces on either side.
# Height of diamond is always going to be an odd number.

# Space between the letters is going to be an odd number.
# First is 0
# Then 1
# Then 3
# Then 5
# etc..
# Length of string is going to be 2x position in alphabet - 1

# Let's do three methods:
#   One for smallest to next to widest
#   One for widest point
#   One for next to widest to smallest


# Smallest to Widest Algorithm
# 0. Create a new string top_half_of_triangle
# 1. Get position of widest_letter in alphabet
# 2. Assign the result of (widest_letter * 2) - 1 to line_length
# 2. Keep a counter for spaces and assign it to 1
# 3. Loop through Alphabet
# 4.  Create a new string current_line
# 5.  Add to current_line:
#       If current_letter is "A"
#         Add only "A"
#       Else
#         Add current_letter, " " * counter , current_letter
#     Add + 2 to counter
# 6.  Center current_line by line_length
# 7.  Add current_line + "\n" to top_half_of_triangle
# 8. Return top_half_of_triangle

# Length at widest point times Height = Length of the string

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.top_half(widest_letter)
    top_half = ''
    widest_letter_position = ALPHABET.index(widest_letter) + 1
    line_length = (widest_letter_position * 2) - 1

    number_of_spaces = 1

    ALPHABET.each do |char|
      current_line = ''

      if char == "A"
        current_line << "#{char}"
      else
        current_line << "#{char}#{" " * number_of_spaces}#{char}"
        number_of_spaces += 2
      end

      top_half << current_line.center(line_length) + "\n"
      break if char == widest_letter
    end

    top_half
  end

  def self.bottom_half(widest_letter)
    # height of diamond is always an odd number
    height_of_diamond = (ALPHABET.index(widest_letter) * 2) + 1
    if height_of_diamond > 1
      # This reverses the top half and height of diamond + 2 puts us to the correct part of the diamond... skips the \n that's at the end of the string, now in front when reversed
      top_half(widest_letter).reverse[height_of_diamond+2..-1] + "\n"
    else
      ""
    end
  end

  def self.make_diamond(widest_letter)
    diamond = ""
    diamond << top_half(widest_letter)
    diamond << bottom_half(widest_letter)
    diamond
  end
end
