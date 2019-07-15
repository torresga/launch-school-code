# For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc #outputs a proc object
puts my_proc.class #outputs Proc
my_proc.call #calls my_proc, thing is nil
my_proc.call('cat') #calls my_proc, thing is 'cat'

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda #outputs Proc object
puts my_second_lambda #outputs Proc object
puts my_lambda.class #outputs Proc
my_lambda.call('dog') #outputs "This is a dog."
my_lambda.call #ArgumentError
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } #NameError: initialized constant Lambda

# lambda and -> both define a Proc object, but we cannot call those objects without an argument for the block.

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} #This returns 'This is a .' because we don't yield the argument to the block.
block_method_1('seal') #This returns a LocalJumpError because we don't call the method with a block.

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} #outputs "This is a turtle"
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end #seal is nil, so outputs "This is a turtle and a ."
block_method_2('turtle') { puts "This is a #{animal}."} #NameError because animal is not defined

# Procs can be called with zero or more arguments. If a block refers to a block variable, that block variable will be nil if the Proc is called without an argument.

# Lambdas are also Proc objects, but they need to be called with however many variables are defined inside the block.

# If a method is defined to yield for a block, we must call that method with a block.

# If we want the block to access a method's argument, we have to pass it into yield. If a argument is not passed into the block, that block variable will be passed nil. We have to define all variables referred to inside of the block, otherwise we will get a NameError.
