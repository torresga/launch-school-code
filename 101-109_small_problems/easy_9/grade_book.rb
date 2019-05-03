# Grade book
# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score Letter  Grade
# 90 <= score <= 100  'A'
# 80 <= score < 90  'B'
# 70 <= score < 80  'C'
# 60 <= score < 70  'D'
# 0 <= score < 60  'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

# Input: Three integers between 0 and 100
# Output: A letter value
# Mental Model: Given three scores represented as integers, determine the mean of the three scores and return the letter value of that grade.

# Example:

# get_grade(95, 90, 93) == "A"
# get_grade(50, 50, 95) == "D"


# Data Structures

# We can store scores in a hash. Key can be letter, value can be a range of scores. Input and output can remain their respective values.

# Algorithm

# Determine mean of three grades.
# Loop through hash values
#   If score is in any range
#     Return key

# Code

LETTER_GRADES = {
  A: (90..100),
  B: (80...90),
  C: (70...80),
  D: (60...70),
  F: (0...60)
  }

def get_grade(first, second, third)
   mean = (first + second + third) / 3
#   key = ''

#   LETTER_GRADES.each do |k, v|
#     if v.include?(mean)
#       key = k
#     end
#   end

#   key.to_s

  grade = LETTER_GRADES.select do |k, v|
    v.include?(mean)
  end

  grade.keys.first.to_s
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Further exploration
# How would you handle this if there was a possibility of extra credit grades causing it to exceed 100 points?
# Add another case statement greater than 100.
