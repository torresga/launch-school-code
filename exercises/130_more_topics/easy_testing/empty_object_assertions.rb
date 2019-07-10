require 'minitest/autorun'

# Empty Object Assertions
#
# Write a minitest assertion that will fail if the Array list is not empty.

class Test < MiniTest::Test
  def test_empty
    value = ["blah"]
    # assert_equal([], value)
    # assert_equal(true, value.empty?)
    assert_empty(value)
  end
end
