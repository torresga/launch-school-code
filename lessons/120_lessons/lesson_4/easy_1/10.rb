# Question 10
#
# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# In order to call the class below, we would have to call the #new method on the class Bag. The #new method would then call the initialize method, which takes two arguments color and material. Those two arguments would then be assigned to their respective instance variables.

birkin = Bag.new("black", "leather")
p birkin
