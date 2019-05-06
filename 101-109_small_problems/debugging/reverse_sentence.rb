# Reverse Sentence
# The reverse_sentence method should return a new string with the words of its argument in reverse order, without using any of Ruby's built-in reverse methods. However, the code below raises an error. Change it so that it behaves as expected.

# def reverse_sentence(sentence)
#   words = sentence.split(' ')
#   reversed_words = []

#   i = 0
#   while i < words.length
#     reversed_words = words[i] + reversed_words
#     i += 1
#   end

#   reversed_words.join(' ')
# end

# p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# On line 10, reversed_words is being reassigned to the array reversed_words + words[i]. reversed_words is an array and words[i] is a string. Since they're two different data types, Ruby raises a TypeError.

# We can change line 10 to read 'reversed_words.prepend(words[i])' . This prepends each current word onto the beginning of the reversed_words array, thus adding the words in reverse order.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
#     Can do either of the following
    # reversed_words.prepend(words[i])
    # reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
