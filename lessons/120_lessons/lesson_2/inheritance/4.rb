# What is the method lookup path and how is it important?

# The method lookup path is the order in which Ruby looks up methods to use in the class. It is important because the order in which methods appear can determine what functionality an object has.

# In the previous example:

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

p Bulldog.ancestors

# We have the class Bulldog which has its own swim method. The superclass Dog also has a swim method. Because of the method lookup path, Ruby starts looking inside of the object's class. Since Bulldog has its' own swim method, that is the method that is called whenever a Bulldog object calls the 'swim' method. Otherwise, Ruby would have started going up the inheritance hierarchy: first object instance's class, then modules, then superclass, until Ruby reaches the Object, Kernel, and BasicObject classes.
