require 'minitest/autorun'

require_relative('swap_letters')

class TestText < MiniTest::Test
  # Your task is to write a test suite for class Text. In that test suite write a test for the Text method swap. For this exercise, you are required to use the minitest methods #setup and #teardown. The #setup method contains code that will be executed before each test; #teardown contains code that will be executed after each test.
  def setup
    # We should probably open the file in here
    @file = File.new("swap_letters_sample_text.txt")
    @full_text = @file.read
    @text = Text.new(@full_text.clone)
  end

  def teardown
    # we should probably close the file in here
    @file.close
  end

  def test_swap
    assert_equal(@full_text.gsub("a", "e"), @text.swap("a", "e"))
  end
end
