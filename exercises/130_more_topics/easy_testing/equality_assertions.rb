require 'minitest/autorun'

# Equality Assertions
#
# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

class Test < MiniTest::Test
  def test_equality
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end
