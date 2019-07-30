# Pig Latin
#
# Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.
#
#     Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
#     Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
#
# There are a few more rules for edge cases, and there are regional variants too.

# One class method that takes a string
# From test cases, doesn't look like I need to validate input - but probably should anyway

# Translate
# Input: A string with just alphabetic characters. can consist of more than one word.
# Output: A string that has each word translated into pig latin

# Rules:
# - Each word needs to be translated to pig latin
# - What is a vowel sound and a consonant sound? From test cases it looks like:
#     - words that start with QU have QU moved to the end of the string
#     - Y and X get moved to the end of the word if the next letter is a vowel (a e i o u)
#     - All other consonants at the beginning of a word, up to a vowel, get put at the end of the string.
#     - Words beginning with a vowel (a e i o u) don't have anything removed from the word.

# Data Structures
# array for more than one word

# Algorithm
# 1. Split word into array.
# 2. Loop through array
# 3. Transform each word in array
# 4. Join array into string
# 5. Return string

# Transform each word in array:
# 1. Case:
# 2. When word starts with "qu"
#     Move "qu" to end of string
#     Add "ay"
# 3. When word starts with y and vowel or x and vowel
#     Move "y" or "x" to end of string
#     Add "ay"
# 4. When word starts with a consonant
#     Move consonants up to vowel to the end of the string
#     Add "ay"
# 5. When word begins with a vowel
#     Add "ay"
# 6. Return word

class PigLatin
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def self.translate(words)
    new(words).translate
  end

  def translate
    words.split.map do |word|
      translate_word(word)
    end.join(" ")
  end

  private

  def translate_word(word)
    case word
    when /[^aeiouyx]*qu/i
      first_u_index = word.index(/u/i) + 1
      word[first_u_index..-1] + word[0...first_u_index] + "ay"
    when /^(y|x)[aeiou]/i
      word[1..-1] + word[0] + "ay"
    when /^[aeiouyx]/i
      word + "ay"
    when /^[^aeiou]/i
      first_vowel_index = word.index(/[aeiou]/i)
      word[first_vowel_index..-1] + word[0...first_vowel_index] + "ay"
    else
      word
    end
  end
end
