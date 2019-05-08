# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# Input: an outer array
# three inner hashes
# in each of those three hashes, a symbol key and an array value
#
# Output: an array containing one hash that has only even values.
#
# ie => [{e: [8], f: [6, 10]}]


arr.select do |inner_hash|
  inner_hash.values.all? do |inner_array|
    inner_array.all? do |num|
      num.even?
    end
  end
end
