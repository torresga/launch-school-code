# Continuing with our Person class definition, what does the below print out?

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

  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# Before to_s: It prints out the object: #<Person:0x0000562a5aafecd8>
# After to_s: It puts out the object's name only.
