# Question 7

# What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

# According to the Ruby docs for the Object class:
# to_s returns a string representing obj. The default to_s prints the object's class and an encoding of the object id.

class Person
end

p = Person.new
puts p
