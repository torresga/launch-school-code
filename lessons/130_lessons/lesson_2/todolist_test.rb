require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    # true if all items in list are done
    @todo1.done!
    @todo2.done!
    @todo3.done!

    assert_equal(true, @list.done?)
  end

  def test_add_type_error
    assert_raises(TypeError) do
      @list.add("hello")
    end

    assert_raises(TypeError) do
      @list.add(1)
    end
  end

  def test_shovel
    @todo4 = Todo.new("Do yoga")
    @list << @todo4
    @todos << @todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    @todo4 = Todo.new("Do yoga")
    @list.add(@todo4)
    @todos << @todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(ArgumentError) do
      @list.item_at
    end

    assert_raises(IndexError) do
      @list.item_at(4)
    end

    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(ArgumentError) do
      @list.mark_done_at
    end

    assert_raises(IndexError) do
      @list.mark_done_at(4)
    end

    assert_equal(true, @list.mark_done_at(1))
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(ArgumentError) do
      @list.mark_done_at
    end

    assert_raises(IndexError) do
      @list.mark_done_at(4)
    end

    @list.mark_done_at(0)
    @list.mark_done_at(2)
    @list.mark_done_at(1)
    @list.mark_undone_at(1)

    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!

    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    # raise IndexError if argument does not return item
    assert_raises(ArgumentError) do
      @list.remove_at
    end

    assert_raises(IndexError) do
      @list.remove_at(100)
    end

    assert_equal(@todo1, @list.remove_at(0))
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done_one
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)

    assert_equal(output, @list.to_s)
  end

  def test_to_s_done_all
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!

    assert_equal(output, @list.to_s)
  end

  def test_each
    counter = 0

    @list.each do |_|
      counter += 1
    end

    assert_equal(3, counter)
  end

  def test_each_return
    obj = @list.each { |_| }

    assert_equal(@list, obj)
  end

  def test_select
    @todo1.done!
    @todo2.done!

    selected_items = @list.select { |todo| todo.done? }

    assert_equal("Today's Todos", @list.title)
    assert_equal([@todo1, @todo2], selected_items.to_a)
  end
end
