# Fibonacci Numbers (Recursion)
# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:

# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2

# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

# Input: One interger argument
# Output: One integer output
# Mental model: Given a positive integer, find the positive integer's Fibonacci number (the sum of the two previous numbers).

# Examples:

# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765

# Data Structures

# Input and output are both integers

# Algorithm

# If n is 1 or 2 is 2
#   Return 1
# Else
#   fibonacci of n - 1 plus fibonacci of n - 2

# Code

def fibonacci(n)
  return 1 if n == 1 || n == 2

  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# Further Exploration
# We will revisit Fibonacci numbers in the next exercise, and, in particular, we will discuss some problems with our recursive solution. Before you move on, take some time to think about our solution (not the tail recursive solution). Can you identify any faults with it? Not bugs, but problems that impact its usability. How might you try to repair the issues you identify? Don't do any coding right now.
