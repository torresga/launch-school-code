# Using the class definition from step #3, let's create a few more people -- that is, Person objects.

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    self.name = name
  end

  def name=(full_name)
    @first_name, @last_name = full_name.split(" ")
    @last_name = @last_name.nil? ? "" : @last_name
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

p bob.name
p rob.name

p bob.name == rob.name
