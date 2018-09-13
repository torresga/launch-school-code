def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# find_first_nonzero_among(0, 0, 1, 0, 2, 0)
# ArgumentError - wrong number of arguments given
# too many arguments.
# find_first_nonzero_among(1)
# NoMethodError - undefined method 'each' for integer
# can't call 'each' on an integer


puts find_first_nonzero_among([0, 0, 1, 0, 2, 0])
puts find_first_nonzero_among([1])
