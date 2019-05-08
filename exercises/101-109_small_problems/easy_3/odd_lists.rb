# PEDAC
#
# Goal: Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

#
# Identify Expected Input or Output
# Make requirements explicit
# Identify rules
# Mental models of problem

# Input: One Array
# Output: One Array
#
# Even though the values are in the 1st, 3rd, 5th, etc. positions, since arrays have indexes starting at zero we are collecting all the elements with an even numbered index.
#
# Create examples/test cases
# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []
#
# Data Structures
# Since both the input and outputs are Arrays, we can continue to work with them for any internal state we have.
#
# Algorithm

# Create new array odds
# Loop through argument array
#   If element has an even index?
#     Add element to a new array
# Return odds array
#
# Code

# def oddities(arr)
#   odds = []
#   counter = 0
#
#   if arr.size > 0
#     loop do
#       if counter.even?
#         odds.push(arr[counter])
#       end
#       counter += 1
#       break if counter == arr.size
#     end
#   end
#
#   odds
# end

# each_with_index
# def oddities(arr)
#   odds = []
#
#   arr.each_with_index do |elem, index|
#     odds << elem if index.even?
#   end
#
#   odds
# end

# each_with_object
# def oddities(arr)
#   arr.each_with_object([]).with_index do |(elem, odds), index|
    # This doesn't work with all edge cases - what if there are two of the same number next to each other?
    # odds << elem if arr.index(elem).even?
    # Try this instead:
#     odds << elem if index.even?
# we can also set a counter variable and increment the counter each time
# and only add to the odds array if the counter is even
#   end
# end

# select
def oddities(arr)
  # Same problem here. arr.index returns the index of the first element with that value. Do not use!
  arr.select.with_index do |elem, index|
    index % 2 == 0
  end
end

puts oddities([2, 2, 3, 4, 5, 6]) == [2, 3, 5]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# Further Exploration
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.
# Similar problem to the first, except that we are looking for the odd numbered indexes
# Test cases?
#
# Try to solve this exercise in at least 2 additional ways.
# Can we extract it to make it more general? Ex: every nth element, starting at x.
def evens(arr)
  even_indices = []
  index = 1

  while index < arr.length
    even_indices << arr[index]
    index += 2
  end
  even_indices
end

puts "\n"
puts evens([2, 3, 4, 5, 6, 7]) == [3, 5, 7]
puts evens([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts evens(['abc', 'def']) == ['def']
puts evens([]) == []

def every_nth(arr, start_with=1, increase_by=2)
  every_nth_arr = []
  index = start_with - 1

  while index < arr.length
    current = arr[index]
    every_nth_arr.push(current)
    index += increase_by
  end
  every_nth_arr
end

puts "\n"
puts every_nth([2, 3, 4, 5, 6, 7], 2, 2) == [3, 5, 7]
puts every_nth([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts every_nth(['abc', 'def', 'ghi', 'jkl'], 1, 3) == ['abc', 'jkl']
puts every_nth([]) == []
