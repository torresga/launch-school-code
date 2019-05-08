# When running the following code...

# class Person
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end
#
# bob = Person.new("Steve")
# bob.name = "Bob"

# We get the following error...
#
# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
#
# Why do we get this error and how to we fix it?

# We get this errror because we are using `attr_reader` on line 4. `attr_reader` creates a getter method, but not a setter method. So we are unable to reset the value of @name to "Bob".
#
# To fix this, we can use `attr_accessor` instead of `attr_reader`.

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
p bob
bob.name = "Bob"
p bob
