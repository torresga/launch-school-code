# PEDAC
# Goal: Write a method that counts the number of occurrences of each element in a given array.

# Identify expected input or output
# Make requirements explicit
# Identify rules
# Input: a non-empty array that has one or more elements. Each element can be of any object type.
# Output: A hash containing the element as the key, and a value of a positive integer that represents the number of occurences of the element in the array.

# Create Examples/Test cases to valid understanding of problem
# Example input: vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
# Example output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# Data Structures
# Input will be an Array data structure
# Output will be a Hash

# Algorithms
# Given an array of objects.
#
# If array is empty?
#   Prompt user to enter a non-empty array.
# End
#
# Loop through array
#   If element is a key in hash,
#     add + 1 to value in hash
#   Else
#     Add element as key and 1 as value in hash
#   End If
# End Loop
# Return hash

# Code

def count_occurrences(arr)
  occurences = {}
  counter = 0

  loop do
    current_element = arr[counter]
    if occurences.has_key?(current_element)
       occurences[current_element] += 1
    else
      occurences[current_element] = 1
    end

    counter += 1
    break if counter == arr.size
  end
  occurences
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

occurences = count_occurrences(vehicles)
occurences.each do |item, occurance|
  puts "#{item} => #{occurance}"
end
