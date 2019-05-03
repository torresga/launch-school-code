# fizzbuzz
# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# Input: Two integer arguments
# Output: A string
# Mental model: Given two numbers, output the numbers between and including those numbers. If the numbers are divisible by 3, 5, or 15, output Fizz, Buzz, or FizzBuzz as appropriate.

# Example:

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Data Structure

# Input are two integers. Output is a string.

# Algorithm
# Loop second number times
# Output current number
#   If current number is divisible by 15
#     Output FizzBuzz
#   Else if current number is divisible by 3
#     Output fizz
#   Else if current number is divisible by 5
#     Output buzz
#   Else
#     Output number

# Code

def fizzbuzz(start, finish)
  start.upto(finish) do |number|

   output = case
     when number % 15 == 0 then "FizzBuzz"
     when number % 3 == 0 then "Fizz"
     when number % 5 == 0 then "Buzz"
     else
       number
     end

    print output
    print ", " if number != finish
  end
end

fizzbuzz(1, 15) #=> "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz"
