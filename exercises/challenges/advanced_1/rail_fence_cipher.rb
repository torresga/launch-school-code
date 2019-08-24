# Rail Fence Cipher

# Two class methods:
#   - encode
#     - Input: Sentence to be encoded, Integer representing a "rail"
#     - Output: A string

# Now what is a rail? Rails is a line

# For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT ONCE", the cipherer writes out:
#
# W . . . E . . . C . . . R . . . L . . . T . . . E - every 4th letter
# . E . R . D . S . O . E . E . F . E . A . O . C . - every 2nd letter
# . . A . . . I . . . V . . . D . . . E . . . N . . - remaining letters


# W E .   C R . L . T . E
# E R D S O E E F E A O C .
# A . I . V . D . E . N .
#
#
#  "WEAREDISCOVEREDFLEEATONCE"
#
#  W E C R L T E

# Go through the string once
#   Loop through string
#   Pop off every rail + 1 letter
#
# Go through the string again
#   Loop through string
#   Pop off every rail - 1 letter
#
# Rest of string

# Data Structure
# A nested array - [[], [], []]

# Algorithm
# Turn string into an array of characters
# Loop until the combined length of all arrays is the length of characters in plaintext
#   Loop from 0 up to rail number
#     Add current letter (arr[x]) to correct array (nested_arr[x])
#
#   Loop from rail number - 2 down to 0 (because we just want to get the middle two - between bottom rail and top, which are covered in previous loop)
#     Add current letter (arr[x]) to correct array (nested_arr[x])

# Flatten nested array
#  Remove nils from nested arrays
# Return joined array

class RailFenceCipher

  def self.encode(str, rails)
    return str if str.empty?

    encoded_message = []
    rails.times { encoded_message << []}
    plaintext = str.chars

    until plaintext.empty?
      0.upto(rails-1) do |current_index|
        encoded_message[current_index] << plaintext.shift
      end

      (rails-2).downto(1) do |current_index|
        encoded_message[current_index] << plaintext.shift
      end

    end

    encoded_message.flatten.reject { |elem| elem.nil? }.join
  end

#   - decode

def self.decode(str, rails)
  return str if str.empty?

  message = []
  rails.times { message << []}
  plaintext = str.chars

  until plaintext.empty?
    0.upto(rails-1) do |current_index|
      message[current_index] << "X"
      plaintext.shift
    end

    (rails-2).downto(1) do |current_index|
      message[current_index] << "X"
      plaintext.shift
    end
  end

  plaintext = str.chars
  message.map do |arr|
    arr.map do |_|
      plaintext.shift
    end
  end


end
end
# Input: A string, number of rails
# Output: The decoded string
# Algorithm
# 1. Get the zig zag shape (meaning, get a nested array with placeholders where the letters are)
    # Create a new array zig_zag
    # Put three arrays in zig_zag
    # Loop until str is empty
    #   Loop from 0 to rails-1
    #     Add placeholder to array at current index
    #
    #   Loop from rails-2 to 1
    #     Add placeholder to array at current index
# 2. Add letters to the zig zag shape
# 3. Zig zag up and down the letters in order

p RailFenceCipher.encode('WEAREDISCOVEREDFLEEATONCE', 3)
# p RailFenceCipher.decode('WECRLTEERDSOEEFEAOCAIVDEN', 3)
