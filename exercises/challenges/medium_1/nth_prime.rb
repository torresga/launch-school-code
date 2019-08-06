# Nth Prime
#
# Write a program that can tell you what the nth prime is.
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# Do not use Ruby's Prime class nor any of the prime-number testing methods in the Integer class. For an algorithm to determine whether a number is prime, check out this article.

# What is a prime number?
# A number whose only factors are itself and 1

# How do we test whether a number is prime:
# 1. Find square root of potential prime number
# 2. Find prime numbers up to square root
# 3. Test whether any of those prime numbers are factors of the potential prime number (whether they are divisible by the potential prime number ie potential prime % prime == 0)
# 4. If any prime numbers are factors of potential prime number, then the number is not prime. Else the number is prime

# - Class Prime:
#   - Class method nth:
#     Input: a number representing the the input-th prime
#     Output: the prime
      # Algorithm:
      # 1. Get a list of primes of nth length
      #   Loop
      #   Add current number to list of primes if the number is prime
      #   Break if list of primes is of nth length
      # 2. Return the last element

# is_prime?
# 1. Find square root of potential prime number
# 2. Find prime numbers up to square root
# 3. Test whether any of those prime numbers are factors of the potential prime number (whether they are divisible by the potential prime number ie potential prime % prime == 0)
# 4. If any prime numbers are factors of potential prime number, return false. Else return true.

# find prime up to that number:
# 1. Generate a list of numbers from 2 up to that number
# 2. Delete number if any in range % number == 0
# 3. Return list of primes

class Prime
  def self.nth(number)
    raise ArgumentError if number.is_a?(String) || number == 0
    
    all_primes = []
    current_number = 2

    until all_primes.length == number
      all_primes << current_number if is_prime?(current_number)
      current_number += 1
    end

    all_primes.last
  end

  def self.is_prime?(number)
    square_root = Integer.sqrt(number)
    primes_of_square = primes(square_root)
    !primes_of_square.any? { |current| number % current == 0 }
  end

  def self.primes(end_number)
    range = (2..end_number).to_a

    range.reject do |current|
      range.any? { |current_in_range| current % current_in_range == 0 && current != current_in_range }
    end
  end
end
