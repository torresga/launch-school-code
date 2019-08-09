# Crypto Square
#
# Implement the classic method for composing secret messages called a square code.
#
# The input is first normalized: The spaces and punctuation are removed from the English text and the message is down-cased.
#
# Then, the normalized characters are broken into rows. These rows can be regarded as forming a rectangle when printed with intervening newlines.
#
# For example, the sentence
#
#     If man was meant to stay on the ground god would have given us roots
#
# is 54 characters long.
#
# Broken into 8-character columns, it yields 7 rows.
#
# Those 7 rows produce this rectangle when printed one per line:
#
# ifmanwas
# meanttos
# tayonthe
# groundgo
# dwouldha
# vegivenu
# sroots
#
# The coded message is obtained by reading down the columns going left to right. For example, the message above is coded as:
#
# imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
#
# Write a program that, given an English text, outputs the encoded version of that text.
#
# The size of the square (number of columns) should be decided by the length of the message. If the message is a length that creates a perfect square (e.g. 4, 9, 16, 25, 36, etc), use that number of columns. If the message doesn't fit neatly into a square, choose the number of columns that corresponds to the smallest square that is larger than the number of characters in the message.
#
# For example, a message 4 characters long should use a 2 x 2 square. A message that is 81 characters long would use a square that is 9 columns wide. A message between 5 and 8 characters long should use a rectangle 3 characters wide.
#
# Output the encoded text grouped by column.

# How do we determine whether length is a perfect square?
# Whether the square root is a whole number

# How do we find the next perfect square that is larger than the message length?
# We find the square root of message length and round up.

# normalize_plain:
#   - removes spaces and punctuation and downcases letters. keeps numbers
#
# size:
#   - determines numbers of columns dependant on message length. if length equals perfect square, size equals half of length. else, find a perfect square that is larger than message length, and half of the square is the number of columns

# plaintext_segments:
#   - Break text into size-length columns

# ciphertext:
#   - Loop through each row
#   - map together current character in each word to form one word

class Crypto
  def initialize(word)
    @word = word
  end

  def normalize_plaintext
    @word.gsub(/[^a-zA-Z0-9]/, '').downcase
  end

  def size
    text_size(normalize_plaintext)
  end

  def plaintext_segments
    plaintext_size = text_size(normalize_plaintext)
    segments(normalize_plaintext, plaintext_size)
  end

  def ciphertext
    ciphertext_segments.join
  end

  def normalize_ciphertext
    # ciphertext_size = text_size(ciphertext)
    ciphertext_segments.join(" ")
  end

  # private

  def segments(text, text_size)
    # Break text into size-length strings
    # Output: an array

    # Create a new array
    # Create a new string
    # Loop
    #   If string is not size length
    #     Add current element to new string
    #   Else
    #     Add string to array
    #     Reset string

    # return array

    all_segments = []
    column_string = ''
    text.each_char do |char|
      if column_string.length < text_size
        column_string << char
      else
        all_segments << column_string
        column_string = "#{char}"
      end
    end

    all_segments << column_string
    all_segments
  end

  def text_size(message)
    # if square root of word.length to_i == square root of word.length
    #   size equals square root to_i
    # else
    #   find square root of message length and round up
    message_length = message.length
    column_size = Math.sqrt(message_length)

    if column_size.to_i == column_size
      column_size.to_i
    else
      column_size.ceil.to_i
    end
  end

  def ciphertext_segments
    # Goal: I want a new array. Current element of the new array has the letter at current index of element.
    # This isn't even map. We put in an array of x length with elements of y width, and we want an array of y length with elements of x width

    # Create a new array
    # Loop first element length times
    #   Create a new string
        # Add element at current index to string
        # If next index, add string to array
    # return array
    arr = []
    plaintext_segments.first.length.times do |num|
      str = ""
      plaintext_segments.each_with_index do |current, idx|
        str << current[num] unless current[num].nil?
      end

      arr << str
    end

    arr
  end
end
