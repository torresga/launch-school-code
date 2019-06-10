# What's the Output?
# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

# Outputs:
# Fluffy
 # My name is FLUFFY.
 # FLUFFY
# FLUFFY

# Because in the to_s method @name is mutated by the upcase! method. Since name and @name refer to the same String object, @name is "FLUFFY" and name (the local variable name) is "FLUFFY".
# We can remove the upcase! method inside of to_s. We can then call upcase on @name.

# Further Exploration
# What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# This code "works" because of that mysterious to_s call in Pet#initialize. However, that doesn't explain why this code produces the result it does. Can you?

# The local variable name is assigned to the Integer object 42
# fluffy is assigned to a new Pet object with name as an argument
# The initialize method calls to_s on the integer object, returning the new String object "42". This new String object is assigned to the instance variable @name.
# The local variable name is being reassigned to the Integer object 43
# the instance variable @name still refers to the string object "42"
# puts fluffy.name outputs the string "42"
# puts fluffy outputs the string "My name is 42"
# puts fluffy.name outputs the string "42"
# puts name outputs the string "43"
# @name and name reference two different objects.
