require 'minitest/autorun'

# Same Object Assertions
#
# Write a test that will fail if list and the return value of list.process are different objects.

class Test < MiniTest::Test
  def test_same
    list = ["hello"]
    assert_same(list, list.process)
  end
end
