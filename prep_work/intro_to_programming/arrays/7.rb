original = [1, 2, 3, 4, 5]

new_array = original.map {|x| x + 2}

p original

p new_array

# NOTE: .each is used for iteration, not mutation. in order to mutate with /each it's necessary to create a new array
