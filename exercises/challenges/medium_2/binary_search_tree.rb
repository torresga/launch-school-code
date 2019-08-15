# Binary Search Tree
#
# Write a program that inserts numbers and searches in a binary tree.

# A binary search tree consists of a series of connected nodes. Each node contains a piece of data (e.g. the number 3), a variable named left, and a variable named right. The left and right variables point at nil, or other nodes. Since these other nodes in turn have other nodes beneath them, we say that the left and right variables are pointing at subtrees. All data in the left subtree is less than or equal to the current node's data, and all data in the right subtree is greater than the current node's data.

# Each inserted number is a new node
# If inserted number is greater than above node,
# Create a new node to the right
# Else
# Create a new node to the left

# What data structure do we represent this as?
# Maybe we can use an array to represent both left and right nodes. Then we can use push and unshift for each node.
# I think left and right nodes need to be new Bst nodes.

# Also looks like we need to include Enumerable

class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  # Insert
  # Input: a number representing a new node's data
  # If node is less or equal to data,
  #   If left node is empty
  #     Add node to left
  #   Else
  #     Insert node in node's left node
  # Else
  #  If right node is empty
  #     Add node to right
  #  Else
  #     Insert node in node's right node

  def insert(node_data, current_node = self)
    if node_data <= current_node.data
      insert_left_node(node_data, current_node)
    else
      insert_right_node(node_data, current_node)
    end
  end

  # Input: A block
  # Iterate over each node
  # Can probably do this with recursion
  # Executes block for each element

  # Until all nodes are traversed −
# Step 1 − Recursively traverse left subtree.
  # - Get to the last element
  # - Yield to the block
  # - Yield to each node above until you hit the top
# Step 2 − Visit root node.
# Step 3 − Recursively traverse right subtree.
  def each(current = self, &block)
    return current.to_enum if !block_given?

    if current.left != nil
      each(current.left, &block)
    end

    yield(current.data)

    if current.right != nil
      each(current.right, &block)
    end
  end

  private

  def insert_left_node(node_data, current)
    if current.left.nil?
      current.left = Bst.new(node_data)
    else
      current = current.left
      insert(node_data, current)
    end
  end

  def insert_right_node(node_data, current)
    if current.right.nil?
      current.right = Bst.new(node_data)
    else
      current = current.right
      insert(node_data, current)
    end
  end
end
