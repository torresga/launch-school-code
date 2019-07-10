require 'minitest/autorun'

# Refutations
#
# Write a test that will fail if 'xyz' is one of the elements in the Array list:

class Test < MiniTest::Test
  def test_refute_includes
    list = ["hello", 'xyz']
    refute_includes(list, 'xyz')
  end
end
