# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# Nested arrays
# map for outer arrays to create a new array
# sort for inner arrays to order by descending order

arr.map do |inner|
  inner.sort do |elem1, elem2|
    elem2 <=> elem1
  end
end
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]
