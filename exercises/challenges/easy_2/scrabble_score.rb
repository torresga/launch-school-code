# Scrabble Score
#
# Write a program that, given a word, computes the scrabble score for that word.
# Letter Values
#
# You'll need these:
#
# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
#
# Examples
#
# "cabbage" should be scored as worth 14 points:
#
#     3 points for C
#     1 point for A, twice
#     3 points for B, twice
#     2 points for G
#     1 point for E
#
# And to total:
#
#     3 + 2*1 + 2*3 + 2 + 1
#     = 3 + 2 + 6 + 3
#     = 5 + 9
#     = 14

# Input: A word
# Output: An integer representing the score for each letter of the word

# Must handle empty string, nil, whitespace, and return 0 for those values
# Must account for both uppercase and lowercase letters

# Data Structure

# because scores (seem) arbitrary, might it be best to use a hash for the scrabble scores. Key can be an array of letters. Value can be integer value of letter.

# Algorithm
# 1. Turn input into string
# 2. Create a variable to keep the final score of the word
# 3. Loop through each character of the word
# 4. Loop through each key of the hash
# 4. If uppercase version of character is in hash
#       Add score to the final score
#    Else add zero
# 5. Return final score

# Code

class Scrabble
  SCORES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G)                 => 2,
    %w(B C M P)             => 3,
    %w(F H V W Y)           => 4,
    %w(K)                   => 5,
    %w(J X)                 => 8,
    %w(Q Z)                 => 10
  }
  SCORES.default = 0

  def initialize(word)
    @word = word.to_s
  end

  def score
    # final_score = 0
    #
    # @word.each_char do |char|
    #   SCORES.each do |key, value|
    #     final_score += value if key.include?(char.upcase)
    #   end
    # end
    #
    # final_score

    @word.chars.map do |char|
      # Have to get current score from SCORES hash
      score = SCORES.select do |k, _|
        k.include?(char.upcase)
      end.values.first

      score.nil? ? 0 : score
    end.sum
  end

  def self.score(word)
    self.new(word).score
  end
end
