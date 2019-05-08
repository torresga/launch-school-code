# Neutralizer
# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

require 'pry'

def neutralize(sentence)
  words = sentence.split(' ')
  non_negative_words = []
  words.each do |word|
    non_negative_words << word if !negative?(word)
  end

  non_negative_words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# Guessing that words.delete is a destructive method. when it deletes word, 'boring' shifts into 'dull''s place because #delete deletes the word in the array it's currently iterating over. then it goes to the next iteration, which is cards.
