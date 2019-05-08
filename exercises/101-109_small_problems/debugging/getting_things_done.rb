# Getting Things Done
# We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?

def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

# todo = ['study', 'walk the dog', 'coffee with Tom']
todo = []
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# A SystemStackError occurs when a piece of code is stuck in an infinite loop. The method 'move' has no base case. This means that there is no condition in which the method will stop calling itself.

# Further Exploration
# What happens if the length of the from_array is smaller than n?
# Nil is added to to_array until n == 0
