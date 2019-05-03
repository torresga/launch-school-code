# Fibonacci Numbers (Last Digit)
# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

# Input: An integer
# Output: An integer representing the last digit of a fibonacci number.
# Mental model: Given an integer, return the last digit of the fibonacci number.

# Using original fibonacci is going to still be too long. Can we use the same overall strategy, but instead of storing the whole number in an array, store the last number?

# Examples:

# fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4

# Data Structure

# Input and output are integers. We can split fibonacci number into digits and return the last digit.

# Algorithm

# Return 1 if n equals 1 or 2
# Create an array fibs of [1, 1]
# While the length of fibs is less than n
#   Add to fibs the last digits of the two previous numbers

# Return the last number in fibs

# Code

# This code doesn't work for the last number, 123456789, because each succesive number is appended to fibs. This means that the array becomes HUGE and takes more processing power than re-assigning fibs. If we re-assign fibs to be a new array, we cannot use the while loop as written below.

def fibonacci_last(n)
  return 1 if n == 1 || n == 2

  fibs = [1, 1]

  while fibs.length < n
    minus_one = fibs[-1].to_s[-1].to_i
    minus_two = fibs[-2].to_s[-1].to_i
    fibs << (minus_one + minus_two).to_s[-1].to_i
  end

  fibs.last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

# Further Exploration
# After a while, even this method starts to take too long to compute results. Can you provide a solution to this problem that will work no matter how big the number? You should be able to return results almost instantly. For example, the 123,456,789,987,745th Fibonacci number ends in 5.
