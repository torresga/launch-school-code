# Welcome Stranger
# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title.

# Input: An array and a hash
# Output: A string
# Mental model: Given an array and a hash, return a string containing elements from input.

# Example:

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Data structure

# Input is an array and a hash and output is a string.

# Algorithm

# Create a new string with string interpolation with each element of the array and each element of the hash.

# Code

def greetings(arr, hsh)
  print "Hello #{arr.join(" ")}! "
  print "Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# Further Exploration
# This method doesn't actually pass rubocop! What is the best way to shorten the lines in this method so it doesn't exceed the 80 maximum characters to a line?
