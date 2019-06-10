# Fix The Program - Expander

# What is wrong with the following code? What fix(es) would you make?

# When we run the code as-is, we get an error that to_s uses a private method called expand. On line 13, we call the method 'expand' with the keyword 'self'. We are not able to call private methods with the self keyword (or an explicit receiver). If we remove the self keyword, then this example should work as expected because private methods are able to be called from inside the class.

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
