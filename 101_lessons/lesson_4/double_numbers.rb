def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    # These lines can be shortened:
    # numbers[counter] = numbers[counter] * 2
    # or numbers[counter] *= 2
    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

p "Doubled numbers #{double_numbers!(my_numbers)}"
p "Original numbers #{my_numbers}"
