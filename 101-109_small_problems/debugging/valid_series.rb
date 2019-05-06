# Valid Series?
# The valid_series? method checks whether a series of numbers is valid. For the purposes of this exercise, a valid series of numbers must contain exactly three odd numbers. Additionally, the numbers in the series must sum to 47.

# Unfortunately, our last test case is not returning the expected result. Why is that?

# Input: an array of numbers
# Output: Boolean representing whether array contains exactly 3 odd numbers, and sum of all numbers in array equals 47

# def valid_series?(nums)
#   return false if nums.sum != 47

#   odd_count = nums.count { |n| n.odd? }
#   odd_count = 3 ? true : false
# end

# p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
# p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
# p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
# p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
# p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

# The last array has a sum of 47, so the issue is stemming from lines 12 and 13.

# From looking at the example array, only one of the integers is odd.
# On line 13, we can see our conditional statement is 'odd_count = 3' This is reassignment. This means that odd_count will always be 3, so true will always be returned (that is, if line 10 is true)

# Adding another equals sign so that the line reads 'odd_count == 3' will ensure this code words correctly:

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

# Further Exploration
# If you take a close look at odd_count == 3 ? true : false, you see that the equality comparison odd_count == 3 itself returns a Boolean. Is the ternary operator on line 5 really necessary in order to return a Boolean from our method?

# No, it's not necessary. Our ternary operator will return true if odd_count == 3, false if odd_count is not 3. odd_count == 3 will return the same thing.
