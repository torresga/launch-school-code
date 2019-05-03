# Multiplicative Average
# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

# Input: An array of integers
# Output: A float
# Mental model: Given an array of integers, multiply all the numbers together, divide the result by the array length, and print the result rounded to 3 decimal places.

# Examples:

# show_multiplicative_average([3, 5])
# The result is 7.500

# show_multiplicative_average([6])
# The result is 6.000

# show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

# Data structure
# Input is an array. Output is a float.

# Algorithm
# Create product variable
# Loop through input array
#   Multiply current value by product

# Return rounded product divided by array's length

# Code

def show_multiplicative_average(arr)
  avg = (arr.reduce(:*).to_f / arr.length)

  "The result is " + sprintf("%#.3f", avg)
end

p show_multiplicative_average([3, 5]) #== "The result is 7.500"

p show_multiplicative_average([6]) #== "The result is 6.000"

p show_multiplicative_average([2, 5, 7, 11, 13, 17]) #== "The result is 28361.667"

# Further Exploration
# What happens if you omit the call to #to_f on the first line of our method?

# Since a lot of products don't divide evenly with their number of elements, not dividing by one float will ensure the average remains an integer and the fractional part will be lost.
