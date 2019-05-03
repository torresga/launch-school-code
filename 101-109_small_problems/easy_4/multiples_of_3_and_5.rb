# Multiples of 3 and 5
 # Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Input: An integer greater than 1.
# Output: An integer that is the sum of all the multiples of 3 OR 5 that lie between 1 and some other number.

# Sum of multiples of 3 or 5
# between 1 and input integer

# One example: 20 is input, output is 98
# 3 + 5
# + 6 (multiple of 3)
# + 9 (multiple of 3)
# + 10 (multiple of 5)
# + 12 (multiple of 3)
# + 15 (multiple of 3 and 5)
# + 18 (multiple of 3)
# + 20 (multiple of 5)

#   Are we including multiples of both 3 and 5? Yes, but make sure this value isnt duplicated

# Examples

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# Data Structure
# Working with multiples of 3 as an array internally
# Working with multiples of 5 as an array internally

# Algorithm

# Get input
# Calculate multiples of 3 up until input
#   Loop
#     counter = 1
      # create an array, multiples of 3
      # break if counter > input
      # add counter to array if counter is divisible by 3
#       add 1 to counter

# Calculate multiples of 5 up until input
#   Loop
#     counter = 1
      # create an array, multiples of 5
      # break if counter > input
      # add counter to array if counter is divisible by 5
#       add 1 to counter

# Filter out multiples for duplicate values
# Add multiples together to create sum
#   Create sum variable
  # Loop through multiples
  #   Add element to sum

# Return sum

# Code

def multisum(integer)
  multiples_of_3 = []
  multiples_of_5 = []

  counter = 1
  loop do
    break if counter > integer
    multiples_of_3 << counter if counter % 3 == 0
    multiples_of_5 << counter if counter % 5 == 0
    counter += 1
  end

  total_multiples = multiples_of_3 + multiples_of_5
  total_multiples.uniq!

  sum = 0
  total_multiples.each do |num|
    sum += num
  end

  sum
end


# puts multisum(3) == 3
# puts multisum(5) == 8
# puts multisum(10) == 33
# puts multisum(20) == 98
# puts multisum(1000) == 234168

# Further Exploration
# Investigate Enumerable.inject (also known as Enumerable.reduce), How might this method be useful in solving this problem? (Note that Enumerable methods are available when working with Arrays.) Try writing such a solution. Which is clearer? Which is more succinct?

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max)
  (0..max).reduce do |sum, number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum + number
    else
      sum + 0
    end
  end
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(20) == 98
puts multisum(1000) == 234168
