# Given the following code...
#
# bob = Person.new
# bob.hi
#
# And the corresponding error message...
#
# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
#
# What is the problem and how would you go about fixing it?

# On line 4, the object 'bob' is trying to call the private method 'hi', which is not accessible outside of the class.
#
# To remedy this, we can either make the 'hi' method public, or we can wrap the 'hi' method inside of a public method so we can use 'hi' outside of a class.
