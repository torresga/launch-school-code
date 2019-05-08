# Ruby passes references to objects. a_string_param and an_array_param are variables local to the method that get references to objects passed into them.
def tricky_method_two(a_string_param, an_array_param)
  # The << method mutates its' caller. a_string_param still references the string passed in as an argument.
  a_string_param << 'rutabaga'
  # This is just assignment, which does not mutate its' caller. an_array_param now refers to a different object than the one passed in as an argument.
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

# The object referenced by my_string has been mutated by the << method. It will be different from the original value.
puts "My string looks like this now: #{my_string}"
# The local variable an_array_param has been reassigned to a different reference than the original my_array object. It will be the original value.
puts "My array looks like this now: #{my_array}"
