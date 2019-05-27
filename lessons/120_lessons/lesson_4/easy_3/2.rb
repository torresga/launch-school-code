# Question 2
#
# In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    Greeting.new.greet("Hi")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# If we call Hello.hi we get an error message. How would you fix this?

# We can create a class method hi in the Hello class.And inside that class method we can define a new Greeting object and call the greeting instance method upon it.

Hello.hi
