# Word to Digit
# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# Input: A string
# Output: A string
# Mental model: Given a string, convert all word instances of numbers into numerical equivalents. Return the same string.

# Example:

# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Data Structures

# We can use a hash to contain the written out versions of numbers mapped to their numeric equivalents.

# Algorithm

# Create a new hash of written to numeric numbers
# Split string into words

# Loop through words
#   If current word without punctuation is a key in hash
#     Reassign to word the numeric equivalent
#     If original word had punctuation, add it


# Return joined words

# Code

WORDS_TO_DIGITS = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9,
  'zero' => 0
  }

def word_to_digit(str)
  words = str.split

  counter = 0
  loop do
    no_punctuation = words[counter].gsub(/\W/, "")

    if WORDS_TO_DIGITS.include?(no_punctuation)
      if words[counter].match?(/\W/)
        words[counter] = WORDS_TO_DIGITS[no_punctuation].to_s + words[counter][-1]
      else
        words[counter] = WORDS_TO_DIGITS[no_punctuation].to_s
      end
    end

    counter += 1
    break if counter == words.size
  end

   words.join(" ")
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Further Exploration
# There are many ways to solve this problem and different varieties of it. Suppose, for instance, that we also want to replace uppercase and capitalized words.

# Can you change your solution this so the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

# What about dealing with phone numbers? Is there any easy way to format the result to account for phone numbers? For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be "(123) 456-7890".
