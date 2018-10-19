def select_fruit(produce)
  produce_keys = produce.keys
  fruit = {}
  counter = 0

  loop do
    current = produce_keys[counter]

    if produce[current] == 'Fruit'
      fruit[current] = produce[current]
    end

    # The break needs to be before counter is incremented,
    # in case produce is an empty hash.
    # Otherwise it will cause an infinite loop.
    break if counter == produce_keys.size
    counter += 1

  end

  fruit
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce)
puts select_fruit({})
