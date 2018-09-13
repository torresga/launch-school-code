numbers = [5, 2, 9, 6, 3, 1, 8]

# should be: even_numbers = numbers.select do |n|
even_numbers = numbers.map do |n|
  # wrong method. map transforms all elements of an array, does not select elements that satisfy a condition.
  n if n.even?
end

p even_numbers
