# Simple Linked List
#
# Write a simple linked list implementation that uses Elements and a List.
#
# The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.
#
# The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).
#
# Lets create a singly linked list to contain the range (1..10), and provide functions to reverse a linked list and convert to and from arrays.

# From test cases it looks like we need to create two classes:
# Element
# SimpleLinkedList

# So a linked list can be represented by an array : [Element, Element, Element]
# Each element has a piece of data and keeps track of its' next element in the list

# Element
#   - Attributes:
#       - @datum
#       - @next_element
#   - Methods:
#       - datum
            # attr reader for datum
#       - tail?
#           Returns whether the element is the last node in a linked list
#       - next
#           Returns the next element in the linked list

# SimpleLinkedList
#   - Attributes:
      # @list - an array to hold the list
#   - Methods:
#       - size
#       - empty?
#       - push
#       - peek
#       - head
#       - pop
#       - from_a
#       - reverse
#       - to_a

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @list = []
    @head = nil
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(elem)
    # When we push a new element, we have to add it to the head
    if empty?
      @head = Element.new(elem)
    else
      @head = Element.new(elem, @head)
    end

    @list.unshift(elem)
  end

  def peek
    @list.first
  end

  def pop
    elem = @list.shift
    @head = Element.new(@list.first)
    elem
  end

  def to_a
    @list
  end

  def reverse
    self.class.from_a(@list.reverse)
  end

  def self.from_a(arr)
    arr = [] if arr.nil?

    new_list = self.new
    arr.reverse_each do |elem|
      new_list.push(elem)
    end

    new_list
  end
end
