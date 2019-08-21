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

# Make a copy of the string
# Loop rails+1 times |current_number|
#   Create a new string
#   Loop through the old string
#     Append every current_number character to new string
#   return string

class RailFenceCipher

  def self.decode(str, rails)
    new_str = ''
    dup_str = str.dup

    (rails+1).downto(1) do |current_number|
      str.split("").each_with_index do |_, idx|
        new_str << dup_str.slice!(idx * current_number) if !str[idx * current_number].nil?
      end
    end

    p new_str
    # p str
  end
end

RailFenceCipher.decode("WEAREDISCOVEREDFLEEATONCE", 3)

#
# # "WE ARE DISCOVERED FLEE AT ONCE" without spaces is 25 characters long
# Each row in above is 25 characters long - and 3 rows

# We want to split string into an array of rails number of rows that are length of the string without spaces?

#   - decode
