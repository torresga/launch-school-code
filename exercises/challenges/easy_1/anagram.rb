# Anagrams
#
# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.
#
# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.

# 1. Understanding the problem:

# We have an Anagrams class

# Anagrams has two methods: initialize and match
# matches are case insensitive

# Initialize method: Creates a new Anagram object
  # Input: takes a string representing a word
  # Algorithm:
  # 1. Assign downcased input word to @target_word

# Match method:
  # Input: An array of strings
  # Output: A new array representing the strings of input that are anagrams
  # Algorithm:
  # 0. Create a sorted_target_word variable
  # 1. Sort @target_word into alphabetical order and assign to sorted_target_word:
  #   - Split @target_word into an array of characters
  #   - Sort characters
  #   - Join word
  # 2. Loop through input array
  # 3.  Create a sorted_current_word variable
  # 4.  Sort current downcased word into alphabetical order and assign to sorted_current_word
  # 5.    Select current word into new array if sorted_target_word == sorted_current_word and @target_word is not current word downcased
  # 7. Return resulting array of current words

  # What is an anagram?
  #
  # From the tests:
  # An anagram has the same letters in the same amounts as the input word
  # An anagram has to have the same length as the input word
  # an anagram is not the input word.

class Anagram
  def initialize(target_word)
    @target_word = target_word.downcase
  end

  def match(potential_matches)
    sorted_target_word = sort_word(@target_word)

    potential_matches.select do |current_word|
      sorted_current_word = sort_word(current_word.downcase)
      sorted_target_word == sorted_current_word && @target_word != current_word.downcase
    end
  end

  private

  def sort_word(word)
    word.chars.sort.join
  end
end
