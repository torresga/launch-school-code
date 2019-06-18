# Circular Queue
#
# A circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular queue, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the queue the longest.
#
# This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires getting rid of an existing object; with a circular queue, the object that has been in the queue the longest is discarded and replaced by the new object.
#
# Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:
#
#     enqueue to add an object to the queue
#     dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.
#
# You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

# enqueue adds an object to the queue.
# Add an object to the queue. Is this the first nil object?
# variable to keep track of oldest object index, variable to keep track of current object

class CircularQueue
  # initialize method, which takes in one argument, which is the length
  # nil may be used to designate empty spots in the buffer
  def initialize(length)
    @value = [nil] * length
    @oldest_idx = 0
    @current_index = 0
  end

  def enqueue(obj)
    @current_index = 0 if @current_index > @value.length - 1
    # when we overwrite we have to account for the oldest_idx in here
    if !@value[@current_index].nil?
      set_oldest_index
    end

    @value[@current_index] = obj
    @current_index += 1
  end

  def dequeue
    return nil if empty_queue?

    oldest_item = @value[@oldest_idx]
    @value[@oldest_idx] = nil

    set_oldest_index
    oldest_item
  end

  private

  def empty_queue?
    @value.all? { |elem| elem.nil? }
  end

  def set_oldest_index
    if @oldest_idx >= @value.length - 1
      @oldest_idx = 0
    else
      @oldest_idx += 1
    end
  end
end

# Examples:

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# The above code should display true 15 times.
