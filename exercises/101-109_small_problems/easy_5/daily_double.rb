# ddaaiillyy ddoouubbllee
# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# Input: One string argument
# Output: A new string containing value of original string without consecutive duplicate characters
# Mental model of problem: Given a string with duplicate letters, return a new string with all duplicate letters removed.

# Examples:

# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# Data structure
# Input is a string, output is a string
# Can split string into array of characters to work with internally

# Algorithm
# Split string into an array of characters
# Create new output string
# Loop through array
#   If current element is equal to next element
#     Add an empty string to new output string
#   Else
#     Add current element to output string
# Return output string

# Code
def crunch(str)
  chars = str.chars
  output = ""

  chars.each_with_index do |char, index|
      if char == chars[index+1]
        output << ""
      else
        output << char
      end
  end
  output
end

def crunch(str)
  output = ""
  counter = 0

  str.each_char do |char|
    output << char unless str[counter+1] == char
    counter += 1
  end
  output
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# Further Exploration
# You may have noticed that we continue iterating until index points past the end of the string. As a result, on the last iteration text[index] is the last character in text, while text[index + 1] is nil. Why do we do this? What happens if we stop iterating when index is equal to text.length?

# Can you determine why we didn't use String#each_char or String#chars to iterate through the string? How would you update this method to use String#each_char or String#chars?

# You can solve this problem using regular expressions (see the Regexp class documentation). For a fun challenge, give this a try with regular expressions. Can you think of other solutions besides regular expressions?
