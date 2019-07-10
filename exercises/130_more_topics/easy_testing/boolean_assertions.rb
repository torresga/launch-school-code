require 'minitest/autorun'

# Boolean Assertions
#
# Write a minitest assertion that will fail if the value.odd? is not true.

class Test < MiniTest::Test
  def test_odd
    value = 24
    # can also use assert here - assert(value.odd?)
    assert_equal(true, value.odd?)
  end
end
