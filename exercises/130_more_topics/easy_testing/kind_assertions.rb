require 'minitest/autorun'

# Kind Assertions

# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

class Test < MiniTest::Test
  def test_kind
    value = 12
    assert_kind_of(Numeric, value)
  end
end
