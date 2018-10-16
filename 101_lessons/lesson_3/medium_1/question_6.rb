# We can refactor this problem my making this into two methods:

def tricky_string(a_string_param)
  a_string_param += "rutabaga"
end

def tricky_array(an_array_param)
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_string(my_string)
tricky_array(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# LS Answer:
 def not_so_tricky_method(a_string_param, an_array_param)
   # Instead of using shovel operator for array, we can use assignment to not mutate original arguments
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  # this returns both parameters
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
