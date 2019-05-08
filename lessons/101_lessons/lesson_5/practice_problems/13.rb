# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically according to the numeric value of the odd integers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
#=> [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# Can we use sort_by to achieve this?

# This sorts the outer array by the sorted inner arrays
arr.sort_by do |inner|
  # This sorts the inner arrays by odd numbers
  inner.sort_by { |x| x.odd? ? 0 : 1 }
end
