# Write a select method that mirrors the behavior of Array#select. Note that the Array#select method takes a block, then yields each element to the block. If the block evaluates to true, the current element will be included in the returned array. If the block evaluates to false, the current element will not be included in the returned array.


def select(array)
  counter = 0
  selected = []

  while counter < array.length
    block = yield(array[counter])
    selected << array[counter] if block
    counter += 1
  end

  selected
end

array = [1, 2, 3, 4, 5]

select(array) do |num|
  num.odd?
end

select(array) do |num|
  puts num
end

select(array) do |num|
  num + 1
end
