# Grade School
#
# Write a small archiving program that stores students' names along with the grade that they are in.
#
# In the end, you should be able to:
#
#     Add a student's name to the roster for a grade
#         "Add Jim to grade 2."
#         "OK."
#     Get a list of all students enrolled in a grade
#         "Which students are in grade 2?"
#         "We've only got Jim just now."
#
#     Get a sorted list of all students in all grades. Grades should sort as 1, 2, 3, etc., and students within a grade should be sorted alphabetically by name.
#
#     {1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}
#
#     The exact output format doesn't matter: what's important is that it shows all of the students and grades in the proper order.
#
# Note that all our students only have one name. (It's a small town, what do you want?)

# Creating a new School class
#   - School has one instance variable, @student_body
#   - @student_body can be represented as a hash
#   - That way we can use hash methods inside below methods
#   School has methods:
#   - to_h
#     - Input: None
#     - Output: Returns school as a hash
#     Returns school as a hash object. Returned hash object should have keys sorted numerically and values sorted alphabetically.
      # - Algorithm
      # - Map hash
      # - Sort the value
      # Sort that array and call to_h on it
#   -add
#     - Input: student represented as a string, grade represented by an integer
#     - Output: None
#     - Adds student to school in grade
#     - Algorithm:
#         - If grade is a key inside @student_body
#         -   Append student to value
#         - Else
#             Assign key to [student]
#
#   -grade
#     - Input: grade represented by an integer
#     - Output: An array representing the students in that grade
#     - Returns an array of the students in that grade. Returns [] if grade does not exist.

class School
  def initialize
    @student_body = Hash.new([])
  end

  def add(student, grade)
    if @student_body.key?(grade)
      @student_body[grade] << student
    else
      @student_body[grade] = [student]
    end
  end

  def grade(grade_number)
    @student_body[grade_number]
  end

  def to_h
    @student_body.transform_values {|students| students.sort }.sort.to_h
  end
end
