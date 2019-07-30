# Circular Buffer
#
# A circular buffer, cyclic buffer or ring buffer is a data structure that uses a single, fixed-size buffer as if it were connected end-to-end.
#
# A circular buffer first starts empty and of some predefined length. For example, this is an empty 7-element buffer:
#
# [ ][ ][ ][ ][ ][ ][ ]
#
# Assume that a 1 is written into the middle of the buffer (exact starting location does not matter in a circular buffer):
#
# [ ][ ][ ][1][ ][ ][ ]
#
# Then assume that two more elements are added, or written to the buffer — 2 & 3 — which get appended after the 1:
#
# [ ][ ][ ][1][2][3][ ]
#
# If two elements are then read, or removed from the buffer, the oldest values inside the buffer are removed. The two elements removed, in this case, are 1 & 2, leaving the buffer with just a 3:
#
# [ ][ ][ ][ ][ ][3][ ]
#
# If the buffer has 7 elements then it is completely full:
#
# [6][7][8][9][3][4][5]
#
# When the buffer is full an error will be raised, alerting the client that further writes are blocked until a slot becomes free.
#
# The client can opt to overwrite the oldest data with a forced write. In this case, two more elements — A & B — are added and they overwrite the 3 & 4:
#
# [6][7][8][9][A][B][5]
#
# Finally, if two elements are now removed then what would be returned is not 3 & 4 but 5 & 6 because A & B overwrote the 3 & the 4 yielding the buffer with:
#
# [ ][7][8][9][A][B][ ]

# Circular buffer:
# - Doesn't matter where you start - first available slot in the buffer
# - Write Adds the element to the buffer
# - Read reads and removes the elements from the buffer
# - Raise errors twice:
#   - When buffer is full
#   - When buffer is empty

# Create a new circular buffer: number in new is the size.

require 'pry'

class CircularBuffer
  attr_accessor :oldest_element_index, :current_element_index
  attr_reader :buffer

  def initialize(length)
    @buffer = Array.new(length)
    @oldest_element_index = 0
    @current_element_index = 0
  end

  def read
    # Input: none
    # Output: The oldest (first) element of the array

    # raise an error if all of the buffer elements are nil
    raise BufferEmptyException if @buffer.all?(nil)
    # Get element at oldest_element_index
    # Assign that slot to nil
    # Move oldest_element_index by 1
    # Return element

    oldest_element = @buffer[oldest_element_index]
    @buffer[oldest_element_index] = nil

    if (oldest_element_index + 1) == @buffer.size
      self.oldest_element_index = 0
    else
      self.oldest_element_index += 1
    end

    oldest_element
  end

  def write(element)
    # Add element to the first empty space inside of the array
    # raise an error if @buffer.all?
    return if element.nil?
    raise BufferFullException if @buffer.all?

    @buffer[current_element_index] = element

    if (current_element_index + 1) == @buffer.size
      self.current_element_index = 0
    else
      self.current_element_index += 1
    end
  end

  def write!(element)
    # Look at the result of current_element_index
    # If it's greater than the buffer size
    #   Set current element to 0
    #   Add 1 to oldest_element_index
    # Add element to buffer
    return if element.nil?

    # If the current element is not nil, add 1 to oldest_element_index
    if !@buffer[current_element_index].nil?
      if oldest_element_index >= @buffer.size - 1
        self.oldest_element_index = 0
      else
        self.oldest_element_index += 1
      end
    end

    @buffer[current_element_index] = element

    if current_element_index >= @buffer.size - 1
      self.current_element_index = 0
    else
      self.current_element_index += 1
    end
  end

  def clear
    @buffer.map! {|element| nil }
    self.current_element_index = 0
    self.oldest_element_index = 0
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
