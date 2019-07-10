require 'minitest/autorun'

# Included Object Assertions
#
# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

class Test < MiniTest::Test
  def test_includes
    list = ["blah", "xyz"]
    assert_includes(list, 'xyz')
  end
end
