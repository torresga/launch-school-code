# Run-length Encoding
#
# Implement run-length encoding and decoding.
#
# Run-length encoding (RLE) is a simple form of data compression, where runs (consecutive data elements) are replaced by just one data value and count.
#
# For example we can represent the original 53 characters with only 13.
#
# "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"
#
# RLE allows the original data to be perfectly reconstructed from the compressed data, which makes it a lossless data compression.
#
# "AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"

# This looks like a problem we can solve with string manipulation. Maybe regex.

# - Initialize
# Two class methods:
# - encode
# - decode

# Encode:
# Input: A string to be encoded
# Output: A shortened string

# Algorithm
# 1. Create new array
# 2. Loop through string
# 3. Create new element in array if current string is a different letter
# 4. Else add letter to last element
# 5. Map array
#6. Add count of letter plus letter
# 7. Join array

# Decode:
# Input: A string to be decoded
# Output: A longer string
# Algorithm
# 1. Split string into array by letter
# 2. Map array
# 3. Letter * count
# 4. Join array to string

class RunLengthEncoding
  def self.encode(input)
    split_input = [input[0]]

    input.each_char do |char|
      if split_input.last[-1] != char
        split_input << char
      else
        split_input.last << char
      end
    end

    split_input.first[0] = ''

    split_input.map do |str|
      str.length == 1 || str.match?(/\s/) ? str : "#{str.length}#{str[0]}"
    end.join
  end

  def self.decode(input)
    split_by_letter = input.scan(/[0-9]*[A-Z]|[0-9]*[\u007B-\u00BF\u02B0-\u037F\u2000-\u2BFF]|[A-Z]|[\u007B-\u00BF\u02B0-\u037F\u2000-\u2BFF]|[ ]/i)
    split_by_letter.map do |elem|
      if elem.length == 1 || elem == " " || elem == ""
        elem
      else
        elem[-1] * elem[0...-1].to_i
      end
    end.join
  end
end
