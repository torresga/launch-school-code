require 'pry'

numbers = [1, 2, 3, 4]
numbers.each do |number|
  binding.pry
  p number
  binding.pry
  numbers.shift(1)
  binding.pry
end

The reason why it goes from 1 to 3... when numbers.shift(1) takes off 1, 2 is now in the zeroeth index. That's the first iteration. In the next iteration, the number is 3 because that's the element that has index 1.

The reason why it doesn't go through the loop with 4... numbers.length is 2, so numbers.each will only loop twice, and it has done so already.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number - is 1
  numbers.pop(1) - [1, 2, 3]
  p number - is 2
  numbers.pop(1) - [1, 2]

Since numbers.length is 2, and #each has already done 2 iterations, the loop stops.

So it prints 1, 2 and returns [1, 2].
