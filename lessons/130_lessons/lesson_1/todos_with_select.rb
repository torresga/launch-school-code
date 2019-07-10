class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description= '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # add (can only add todo objects)
  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.is_a?(Todo)
    @todos << todo
  end

  # <<
  def <<(todo)
    add(todo)
  end

  # size
  def size
    @todos.size
  end

  # first
  def first
    @todos.first
  end

  # last
  def last
    @todos.last
  end

  # to_a
  def to_a
    @todos.clone
  end

  # done? - returns true if all todos in the list are done, otherwise false
  def done?
    @todos.all? {|todo| todo.done? }
  end

  # item_at
  def item_at(index)
    @todos.fetch(index)
  end

  # mark_done_at
  def mark_done_at(index)
    item_at(index).done!
  end

  # mark_undone_at
  def mark_undone_at(index)
    item_at(index).undone!
  end

  # done! - marks all items as done
  def done!
    @todos.each {|todo| todo.done! }
  end

  # shift
  def shift
    @todos.shift
  end

  # pop
  def pop
    @todos.pop
  end

  # remove_at
  def remove_at(index)
    raise IndexError if index > size
    @todos.delete_at(index)
  end

  #to_s
  def to_s
    "---- #{title} ----\n" +
    @todos.map { |todo| todo.to_s }.join("\n")
  end

  def each
    @todos.each do |todo|
      yield(todo) if block_given?
    end

    self
  end

  def select
    new_list = TodoList.new(title)

    each do |todo|
      new_list << todo if yield(todo)
    end

    new_list
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect

p list.each do |todo|
  puts todo                   # calls Todo#to_s
end
