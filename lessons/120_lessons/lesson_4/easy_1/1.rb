# Question 1
#
# Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?
#
#     true
#     "hello"
#     [1, 2, 3, "happy days"]
#     142

# They are all objects in Ruby. You can find out what class each belongs to by using the class method:

p true.class #TrueClass
p "hello".class #String
p [1, 2, 3, "happy days"].class #Array
p 142.class #Integer
