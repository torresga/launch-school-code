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
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add
# ---- Interrogating the list -----

# # size
p list.size                       # returns 3
#
# # first
p list.first                      # returns todo1, which is the first item in the list
#
# # last
p list.last                       # returns todo3, which is the last item in the list
#
# #to_a
p list.to_a                      # returns an array of all items in the list
#
# #done?
p list.done?                     # returns true if all todos in the list are done, otherwise false
#
# # ---- Retrieving an item in the list ----
#
# # item_at
# p list.item_at                    # raises ArgumentError
p list.item_at(1)                 # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError
#
# # ---- Marking items in the list -----
#
# # mark_done_at
# p list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
p list.item_at(1)
# list.mark_done_at(100)          # raises IndexError
#
# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
p list.item_at(1)
# list.mark_undone_at(100)        # raises IndexError
#
# # done!
# list.done!                      # marks all items as done

# ---- Deleting from the list -----
#
# shift
p list.shift                      # removes and returns the first item in list
p list
# # pop
# p list.pop                        # removes and returns the last item in list
# p list
# # remove_at
# list.remove_at                  # raises ArgumentError
p list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError
#
# # ---- Outputting the list -----
#
# # to_s
puts list.to_s                      # returns string representation of the list
#
# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym
#
# # or, if any todos are done
#
# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym
