# Question 3
#
# When objects are created they are a separate realization of a particular class.
#
# Given the class below, how do we create two different instances of this class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# We create two different instances of this class by creating two different variables and assigning two new objects to each of them:

grumpy = AngryCat.new(10, "Grumpy Cat")
grainne = AngryCat.new(14, "Grainne")

p grumpy
p grainne

p grumpy.object_id
p grainne.object_id
