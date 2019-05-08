def multiply(numbers, multiply_by)
  new_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]

    if multiply_by.class == Integer
      new_numbers << current_number * multiply_by
    end

    counter += 1
  end
  new_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
