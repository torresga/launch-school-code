require 'minitest/autorun'

# Exception Assertions
#
# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

class NoExperienceError < StandardError
end

class Employee
  def hire
    raise NoExperienceError
  end
end

class Test < MiniTest::Test
  def test_exception
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end
