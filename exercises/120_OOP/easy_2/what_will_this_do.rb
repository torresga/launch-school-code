# What Will This Do?
# What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

# Initializing a Something object - creates an instance variable @data with String 'Hello'
thing = Something.new

# Calling the dupdata class method, will output 'ByeBye'
puts Something.dupdata

# This is calling the dupdata instance method, will output the return value 'HelloHello'
puts thing.dupdata
