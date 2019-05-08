# Rotation (Part 3)
# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

# Have to work this in reverse. Realized that rotate_rightmost_digits(735291, 6) is the same as 352917. We can loop 6 times, passing in the return result of rotate_rightmost_digits into itself.

# Input: An integer
# Output: An integer
# Mental model: Given an integer, increase the number of digits fixed in place and rotate the rest to the right.

# Example:

# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

# Data Structures
# Input and output are integers. Inside the method we can convert the integer into an array to better work with each individual digit.

# Algorithm
# Loop number of digit times
#   Rotate digits of current number

# Return new number

# Code

def rotate_array(arr)
  copied_arr = arr.dup

  copied_arr << copied_arr.shift

  copied_arr
end

def rotate_rightmost_digits(number, position)
  digits = number.digits.reverse

  (digits + rotate_array(digits.pop(position))).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# def rotate_rightmost_digits(number, position)
#   digits = number.digits.reverse

#   target = digits.slice!(digits.length-position, 1)

#   digits << target

#   digits.join.to_i
# end

def max_rotation(number)
  rotated_number = number

  number.digits.length.downto(1) do |position|
    rotated_number = rotate_rightmost_digits(rotated_number, position)
  end

  rotated_number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Further Exploration
# Assume you do not have the rotate_rightmost_digits or rotate_array methods.

# How would you approach this problem? Would your solution look different? Does this 3 part approach make the problem easier to understand or harder?

# Solution without rotate_rightmost_digits or rotate_array

# 7 3 5 2 9 1
# 3 5 2 9 1 7
# 3 2 9 1 7 5
# 3 2 1 7 5 9
# 3 2 1 5 9 7
# 3 2 1 5 7 9

# Loop through array
# Take current element out of array
# Add current element to end of array

def max_rotation(number)
  digits = number.digits.reverse
  counter = 0

  loop do
    current = digits.slice!(counter, 1)
    digits << current

    counter += 1
    break if counter == number.to_s.size
  end

  digits.join.to_i
end

p max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(35) #== 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845

# This 3 part approach makes the problem harder to solve - instead of moving the current element to the end, we focus on moving the right most element.

# There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros. Can you create a solution that preserves zeros?

# Solution that preserves zeroes
# Is a solution that preserves zeroes even possible when returning an integer?

def max_rotation(number)
  digits = number.digits.reverse
  counter = 0

  loop do
    current = digits.slice!(counter, 1)
    digits << current

    counter += 1
    break if counter == number.to_s.size
  end

  digits.join
end
