# Fixed Array

class FixedArray
  # Looks like we need to create an initialize method that takes one argument, which is the length of the array that will be created.
  def initialize(arr_length)
    @length = arr_length
    @value = [nil] * @length
  end

  # it looks like we need to create a [] method which takes one integer argument. which returns the element at integer index.
  def [](index)
    value.fetch(index)
  end

  # we also need to create a []= method that takes an element and reassigns the element at that position
  def []=(index, new_value)
    # we need to raise an exception if index > arr_length
    raise IndexError if index > @length
    value[index] = new_value
  end

  # then we need to create to_a method
  def to_a
    # better to use clone so we can create a new copy of value
    value
  end

  # to_s method
  def to_s
    value.to_s
  end

  private

  attr_accessor :value
end

# A fixed-length array is an array that always has a fixed number of elements. Write a class that implements a fixed-length array, and provides the necessary methods to support the following code:

# fixed_array = FixedArray.new(5)
# p fixed_array
# p fixed_array.to_a
# p fixed_array.to_s
# p fixed_array[3]
# p fixed_array[3] = "hello"
# p fixed_array
# p fixed_array[3]

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

# The above code should output true 16 times.
