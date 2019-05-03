# ASCII String Value
# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

# Input: A string consisting of 0 or more characters
# Output: An integer representing the sum of each ASCII value of every character in the string
# Mental models: Using String#ord, calculate the ASCII value of every character in the inputted string, then sum these values together and return the result.

# Chars - including uppercase and lowercase letters. Are we including spaces and numbers? How about punctuation? Yes we are including spaces, numbers, and punctuation. We can create some test cases to test strings that include punctuation and numbers.

#   Examples:
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0
# ascii_value('h4x0r') == 438
# ascii_value('123 4') == 234

# Algorithm
# Break our string into characters
# Create variable to hold sum

# Loop through our characters
#   Add char's ord value to sum

# Return the sum

# Code
def ascii_value(str)
# characters = str.chars
#   sum = 0

#   characters.each do |char|
#     sum += char.ord # sum = sum + char.ord
#   end

#   sum

 return 0 if str == ''

 ords = str.chars.map {|c| c.ord }

 ords.reduce do |sum, c|
   sum + c
 end
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0
puts ascii_value('h4x0r') == 438
puts ascii_value('123 4') == 234

# Further Exploration
# There is an Integer method such that:

# char.ord.mystery == char
# where mystery is our mystery method. Can you determine what method name should be used in place of mystery? What happens if you try this with a longer string instead of a single character?

# Has to be a method that is opposite of ord - called on an Integer object, and returns a string containing a char that has that ord value.

# That method is called Integer#chr.

# "cba".ord.chr == "cba" is false
# but "cba".ord.chr == "c" is true because "cba".ord.chr returns the first character in the string "cba".
