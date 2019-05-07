# Create a class 'Student' with attributes name and grade. Do NOT make the grade getter public, so joe.grade will raise an error. Create a better_grade_than? method, that you can call like so...

class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    self.name = name
    self.grade = grade
  end

  def better_grade_than?(person)
    grade > person.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 40)

puts "Well done!" if joe.better_grade_than?(bob)
