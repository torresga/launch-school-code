# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.



# => [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

# map for outer array
# obvs we can't edit hash while iterating over it, instead it's best just to create a new hash object

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.each_with_object({}) do |(key, value), new_hash|
    new_hash[key] = value + 1
  end
end
