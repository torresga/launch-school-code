# Try to write a reduce method on your own that exhibits this behavior. Your reduce should take at least 1 argument that represents the array we'll operate on. It should also take an optional second argument that represents the default value for the accumulator. Here's a few examples that we should be able to call on your method.

def reduce(array, accumulator = 0)
  reduced = accumulator
  counter = 0

  while counter < array.size
    reduced = yield(reduced, array[counter])
    counter += 1
  end

  reduced
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
