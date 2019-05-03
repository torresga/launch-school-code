# Letter Swap
# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

# Input: One string of at least 1 word containing at least one letter separated by spaces
# Output: One string in which the first and last letters of every word are swapped.
# Mental model of problem: Take a string containing nothing but words and spaces and swap the first and last characters of each word in the string. Return the new swapped string.

# To swap letters in a word, the word has to have more than 1 character in it.

# Examples:

# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# Data Structures
# Input is a string. Internally, we can split the input into an array. We can create a new array for the mutated words. This array can be joined together and be returned as output.

# Algorithm
# Get input string.
# Create new output array
# Split input string according by spaces, into an array of words
# Loop through words array
#   If word only has one character
#     Add unchanged word to output array
#   Else
#     Create a word that has swapped first and last letters
#     Add word to the array
# Join words together into a string with spaces
# Return new string

# Code

def swap(str)
#   swapped_words = []
#   input_arr = str.split(" ")

#   input_arr.each do |word|
#     if word.size == 1
#       swapped_words << word
#     else
#       first = word[0]
#       last = word[-1]

#       swapped_words << "#{last}#{word[1..-2]}#{first}"
#     end
#   end
#   swapped_words.join(" ")

    input_arr = str.split(" ")
    swapped_words = input_arr.map do |word|
      word.size > 1 ? "#{word[-1]}#{word[1..-2]}#{word[0]}" : word
    end
    swapped_words.join(" ")
 end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

# Further Exploration
# How come our solution passes word into the swap_first_last_characters method invocation instead of just passing the characters that needed to be swapped? Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end

# and called the method like this:

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0],word[-1])
  end
  result.join(' ')
end

puts "\n"
puts swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') #== 'ebcdA'
puts swap('a') #== 'a'

# Would this method work? Why or why not?
# This swap method outputs the following:
# h O t w a a l w y d t i s i
# e A
# a a

# This method does not work as expected because on line 67, the method 'swap_first_last_characters' returns the value of a and the value of b as an array. This is why "a" and "b" have spaces in between the letters when output. This is also why each character printed is only the last and first letters in each word vs the whole word with first and last letters reversed.
