# Simple Cipher
#
# Implement a simple shift cipher like Caesar and a more secure substitution cipher.
#
# Here are some examples:
#
# @cipher = Cipher.new
# @cipher.encode("iamapandabear") #=> "ldpdsdqgdehdu"
# @cipher.decode("ldpdsdqgdehdu") #=> "iamapandabear"
#
# Step 2:
#
# Shift ciphers are no fun though when your kid sister figures it out. Try amending the code to allow us to specify a key and use that for the shift distance. This is called a substitution cipher.
#
# Here's an example:
#
# @cipher = Cipher.new("aaaaaaaaaaaaaaaaaa")
# @cipher.encode("iamapandabear") #=> "iamapandabear"
# @cipher = Cipher.new("ddddddddddddddddd")
# @cipher.encode("imapandabear") #=> "lpdsdqgdehdu"
#
# In the example above, we've set a = 0 for the key value. So when the plaintext is added to the key, we end up with the same message coming out. So "aaaa" is not an ideal key. But if we set the key to "dddd", we would get the same thing as the Caesar Cipher.
#
# Step 3:
#
# The weakest link in any cipher is the human being. Let's make your substitution cipher a little more fault tolerant by providing a source of randomness and ensuring that they key is not composed of numbers or capital letters.
#
# If someone doesn't submit a key at all, generate a truly random key of at least 100 characters in length, accessible via Cipher#key (the # syntax means instance variable)
#
# If the key submitted has capital letters or numbers, throw an ArgumentError with a message to that effect.
#
# Some examples:
#
# @cipher = Cipher.new
# @cipher.key #=> "duxrceqyaimciuucnelkeoxjhdyduucpmrxmaivacmybmsdrzwqxvbxsygzsabdjmdjabeorttiwinfrpmpogvabiofqexnohrqu"

# default cipher shifts everything 3 letters down

# cipher can take a string specifying a key. That key specifies how many the plaintext is shifted
# if key is capitalized, empty, or a number, an error is raised
# If key only has one letter, then we can shift every element in the string by that difference
# Else we shift each letter by corresponding key index letter. if the key is shorter than the plaintext, we shift by corresponding letters up to the last letter in key, and rest of letters in plaintext get shifted by last key

class Cipher
  ALPHABET = ('a'..'z').to_a

  attr_reader :key

  def initialize(key = "ddddddddddddddddd")
    raise ArgumentError if key.empty? || key.match?(/[A-Z0-9]/)
    @key = key
  end

  # Input: A string to be encoded
  # Output: The encoded string
  # Algorithm
  # 1. Loop through the key
  # 2. Loop through the text
  # 3. Calculate the shift between current letter of string vs. key
  # 4.  If last letter of key, rest of string will be shifted by last letter
  # 5. Shift string
  # 6. Return new string

  def encode(text)
    encoded_str = ''
    text.split('').each_with_index do |char, index|
      current_index = ALPHABET.index(char)
      shift = key[index].nil? ? ALPHABET.index(key[-1]) : ALPHABET.index(key[index])
      encoded_str << ALPHABET[(current_index + shift) % 26]
    end

    encoded_str
  end

  # Input: A string to be decoded
  # Output: The decoded string
  # Algorithm
  # 1. Loop through the key
  # 2. Loop through the text
  # 3. Calculate the shift between current letter of string vs. key
  # 4.  If last letter of key, rest of string will be shifted by last letter
  # 5. Shift string
  # 6. Return new string
  def decode(text)
    encoded_str = ''
    text.split('').each_with_index do |char, index|
      current_index = ALPHABET.index(char)
      shift = key[index].nil? ? ALPHABET.index(key[-1]) : ALPHABET.index(key[index])
      encoded_str << ALPHABET[(current_index - shift) % 26]
    end

    encoded_str
  end
end
