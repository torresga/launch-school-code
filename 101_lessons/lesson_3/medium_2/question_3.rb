# Ruby passes references to objects in methods.
def tricky_method(a_string_param, an_array_param)
  # This is assignment. This will not modify the argument outside of tricky_method. Also, a_string_param points to a different object instead of the original object.
  # These are local variables that get references to some object.
  a_string_param += "rutabaga"
  # The << is a mutating method. It will modify the argument an_array_param outside of tricky_method.
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

# The assignment in tricky_method does not hold outside of tricky_method. The variables a_string_param and my_string point to two different objects.
puts "My string looks like this now: #{my_string}"
# The method call does hold outside of tricky_method. my_array will be different.
puts "My array looks like this now: #{my_array}"
