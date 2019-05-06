# HEY YOU!
# String#upcase! is a destructive method, so why does this code print HEY you instead of HEY YOU? Modify the code so that it produces the expected output.

# def shout_out_to(name)
#   name.chars.each { |c| c.upcase! }

#   puts 'HEY ' + name
# end

# shout_out_to('you') # expected: 'HEY YOU'

# On line 5, the parameter string, has the String#chars method called upon it. The return value for this method is an array. On this array, the method Array#each is called. Inside the method's adjoining block, each character is being mutated with String#upcase!.

# This doesn't work as we expect since we are not modifying each character string that makes up the string assigned to 'name'. Rather, we get a new object, an array, when we call String#chars upon name. During each iteration of Array#each upon that new array object, we mutate each string object in the array, each of which is a different object than the string characters that make up the original string.

# To change the output, we can remove the #chars and #each methods, and use String#upcase! to mutate the entire string object inside of 'name'.

def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
