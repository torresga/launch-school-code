# Generic Greeting (Part 1)
#
# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.
#
# class Cat
# end
#
# Cat.generic_greeting
#
# Expected output:
#
# Hello! I'm a cat!

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# Further Exploration
#
# What happens if you run kitty.class.generic_greeting? Can you explain this result?

# kitty.class.generic_greeting returns "Hello! I'm a cat!" This is because kitty.class returns the class of the object that #class was called upon. In this case, Cat. Then generic_greeting is called upon the Cat class. It is like as if generic_greeting was called upon the Cat class directly- that's why generic_greeting greeting works and does not give an error.
