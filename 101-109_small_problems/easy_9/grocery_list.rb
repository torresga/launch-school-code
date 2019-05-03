# Grocery List
# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# Input: A nested array of strings and integers
# Output: One array
# Mental model: Given a nested array of strings and integers, create a new array with the strings integer number of times.

# Example:

# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Data Structure

# Input is an array. Output is an array.

# Algorithm

# Create new array
# Loop over input array
#   Add to new array the strings in the amount of the input.

# Return new array

# Code

def buy_fruit(list)
  new_list = []

  list.each do |item|
    amount = item.last

    amount.times do
      new_list << item.first
    end
  end

  new_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
