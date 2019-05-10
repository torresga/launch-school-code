# Hello, Chloe!
#
# Using the following code, add an instance method named #rename that renames kitty when invoked.
#
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    @name = name
    # or self.name = name to use the setter method
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name
#
# Expected output:
#
# Sophie
# Chloe
