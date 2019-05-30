# Complete The Program - Houses
#
# Assume you have the following code:

# Right idea.. but we can use the Compararable module instead of defining our own.
# module Comparison
#   def <(other_home)
#     @price < other_home.price
#   end
#
#   def >(other_home)
#     @price > other_home.price
#   end
# end

class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  # This is the one method the exercise is talking about. We don't have to define > or <.
  def <=>(other_home)
    price <=> other_home.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# and this output:
#
# Home 1 is cheaper
# Home 2 is more expensive
#
# Modify the House class so that the above program will work. You are permitted to define only one new method in House.
