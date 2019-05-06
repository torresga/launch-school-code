# How do we create an object in Ruby? Give an example of the creation of an object.
# We create an object in Ruby by using the 'new' class method, either with a class we create, or on a pre-built class

s = String.new
p s

class Dog
end

trip = Dog.new
p trip
