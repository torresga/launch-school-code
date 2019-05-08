# Fibonacci Numbers (Procedural)
# In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results without recursion.

# Input: An integer
# Output: An integer
# Mental model: Given an integer, compute its' fibonacci number.

# Examples:

# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

# Data Structures

# Input and output are integers.

# Algorithm

# If n is 1, return 1
# If n is 2, return 1

# create an array with [1, 1]

# while array.length < n
#   add together last and next to last element together
#   push it to array

# return last number

# Code

def fibonacci(n)
  return 1 if n == 1 || n == 2

  fibs = [1, 1]

  while fibs.length < n
    fibs << fibs[-1] + fibs[-2]
  end

  fibs.last
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
