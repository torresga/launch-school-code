require 'minitest/autorun'

# Nil Assertions

# Write a minitest assertion that will fail if value is not nil.

class Test < MiniTest::Test
  def test_nil
    value = nil
    # can also use assert_equal(nil, value)
    assert_nil(value)
  end
end
