# Bubble Sort
# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

# Input: An array of at least 2 elements
# Output: The sorted same array

# Examples

# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Data Structures

# Array

# Algorithm

# Loop through array
#   If current element is greater than next element
#     Next element is current element, current element is next element

# Code

def bubble_sort!(array)
  counter = 0
  loop do
    inner_counter = 0
    loop do
#     if there is a next element
      if array[inner_counter+1] != nil
        if array[inner_counter] > array[inner_counter+1]
          array[inner_counter], array[inner_counter+1] = array[inner_counter+1], array[inner_counter]
        end
      end

      break if inner_counter == array.size
      inner_counter += 1
    end

    break if counter == array.size
    counter += 1
  end

  array

end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Further Exploration
# Note that we did not use the optimization suggested on the Wiki page that skips looking at tail elements that we know are already sorted. If your solution also skipped this optimization, try modifying your solution so it uses that optimization.
