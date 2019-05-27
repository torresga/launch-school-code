# Question 1
#
# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:
#
# case 1:

hello = Hello.new
hello.hi
# Outputs "Hello"

# case 2:

hello = Hello.new
hello.bye
# Returns a NoMethodError because Hello does not have a bye method, nor does Greeting.

# case 3:

hello = Hello.new
hello.greet
# Returns an ArgumentError - needs to be called with an argument

# case 4:

hello = Hello.new
hello.greet("Goodbye")
# Outputs "Goodbye"

# case 5:

Hello.hi
# Returns a NoMethodError because there is no class method hi
