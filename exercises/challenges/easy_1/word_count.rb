# Word Count
#
# Write a program that given a phrase can count the occurrences of each word in that phrase.
#
# For example, if we count the words for the input "olly olly in come free", we should get:
#
# olly: 2
# in: 1
# come: 1
# free: 1

# - initialize
#   Input: phrase
#   Output: none
#   Assign phrase to a @phrase instance variable
#
# - word_count
#   Input: None
#   Output: A hash with each word of the phrase with a count
#   Algorithm
#   Downcase phrase
#   Split the phrase into words
#   Create a new count hash
#   Loop over words |word|
#     Remove extra spacing and punctiation that is at the beginning and end of  the phrase
#     If word is already in hash
#       Add 1 to value
#     Else
#       Add key: word, value: 1
#   Return count hash

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    count = {}

    @phrase.downcase.split(/(\s+)|[.,:]/).reject do |word|
      ["", " ", "\n"].include?(word)
    end.each do |word|
      word.gsub!(/(^[^a-z0-9]+)|([^a-z0-9]+$)/, '')
        if count.key?(word)
          count[word] += 1
        else
          count[word] = 1
        end
      end

    count
  end
end

# Want to remove
# - non alphanumeric characters at the start
# - non alphanumeric characters at the end
# - standalone alphanumeric characters

# Split the string on either one or more spaces or punctuation (commas or . or : or ;)
# Reject elements out of the resulting array that are spaces
# Loop through the resulting array
#   Remove non-word characters from beginning and end of the string
#   If resulting word is a key in count
#     Add that word and increase count
#   Else assign count[word] = 1
