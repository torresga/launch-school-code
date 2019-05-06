# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Input: One string containing 0 or more pairs of parentheses
# Output: A boolean representing whether the parentheses are in the order ()
# Mental model: Given a string, determine if the parentheses in the string are balanced, that is, if ( ) occur in the same amounts and if ( apppears after ).

# count of () has to be even
# but ( has to be before )

# if we have a count for ( and ), and add 1 when we come across ( and subtract when we come across ), we will know that the parentheses are balanced when count equals 0.

# Examples:

# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false
# Note that balanced pairs must each start with a (, not a ).

# Data Structures

# internally represented as a string - loop through string with each_character

# Algorithm

# Create count

# Loop over each character in the string
#   add 1 if character is (
#   subtract 1 if character is )

# Return false if count < 1 or count > 1

# Code

def balanced?(str)
   count = 0
  str.each_char do |char|
    count += 1 if char == "("
    count -= 1 if char == ")"

    break if count == -1
  end

  count == 0 ? true : false

  balanced_left
  balanced_right
end

p balanced?('What (is) this?') #== true
p balanced?('What is) this?') #== false
p balanced?('What (is this?') #== false
p balanced?('((What) (is this))?') #== true
p balanced?('((What)) (is this))?') #== false
p balanced?('Hey!') #== true

# This is why in the original solution the loop broke if count == -1, here in these two examples, the count is 0.
p balanced?(')Hey!(') #== false
p balanced?('What ((is))) up(') #== false

# Further Exploration
# There are a few other characters that should be matching as well. Square brackets and curly brackets normally come in pairs. Quotation marks(single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

def balanced?(str)
  count = 0
  balanced_left = ["(", "[", "{", "'", '"']
  balanced_right = [")", "}", "]", "'", '"']

  str.each_char do |char|
    count += 1 if balanced_left.include?(char)
    count -= 1 if balanced_right.include?(char)

    break if count == -1
  end

  count == 0 ? true : false

end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true

# This is why in the original solution the loop broke if count == -1, here in these two examples, the count is 0.
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false

p balanced?("What's next? []{}")
p balanced?("[]{}")
