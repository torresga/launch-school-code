# 1000 Lights
# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

# Input: An integer that represents the total number of switches
# Output: An array that identifies which lights are on
# Mental model: Given an integer, create a data structure that is numberered from 1 to n. On the first repetition, toggle all the switches on. On the second repetition, toggle every other switch starting from 2. On the third, toggle every other switch starting from 3. Repeat through n repetitions and return the numbers of the switches that remain on.

# It looks from these examples that the first light is always on.

# Data Structures

# Input is an integer argument greater than 0.
# Hash - keys are numbers 1 through n, values are initially false
# Output is an array

# Algorithm

# Create a hash that has keys numbers 1 through n, values are the boolean false
# Loop n times
#   if key is multiple of current number
#     make the value opposite

# Return the keys that have the values true

# Code

def generate_str(arr)
  #   Create a string for each of the lights arrays.
# Loop through array
  # Add current element to new string
#   If array is 2 elements long and its the next to last element
#   Add "and"
  # If current element is next to last
  #   add ", and"
  # Else
  #   if current element is not the last element
#      add ","
  str = ""
  counter = 0
  loop do
    str << arr[counter].to_s

    if arr.size == 2 && counter == arr.size-2
      str << " and "
    elsif counter == arr.size-2
      str << ", and "
    elsif counter != arr.size-1
      str << ", "
    end

    counter += 1
    break if counter == arr.size
  end

  str
end

def display_light_round(round, hsh)
  if round == 1
    puts "round 1: every light is turned on"
    return
  end

  on_lights = hsh.select {|k, v| v }.keys
  off_lights = hsh.select {|k, v| v == false }.keys

  puts "round #{round}: lights #{generate_str(off_lights)} are now off; #{generate_str(on_lights)} are on"

end

def display_light_result(lights)
  puts "The result is that #{lights.size} lights are left on, lights #{generate_str(lights)}. The return value is #{lights}."
end



def lights(n)
  switches = Hash.new
  start = 1

  (start..n).each do |num|
    switches[num] = false
  end

  start.upto(n) do |current|
    switches.keys.each do |key|
      if key % current == 0
        switches[key] = !switches[key]
      end
    end
    display_light_round(current, switches)
  end

  display_light_result(switches.select {|_, v| v }.keys)
end

lights(5)

# p lights(5) == [1, 4]

# p lights(10) == [1, 4, 9]

# p lights(20)

# p lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# Do you notice the pattern in our answer? Every light that is on is a perfect square. Why is that?

# Because the numbers that aren't perfect squares are turned off by another number.

# What are some alternatives for solving this exercise? What if we used an Array to represent our 1000 lights instead of a Hash, how would that change our code?
# If we used an array to represent our lights, then index+1 can represent the number of the switch and the element would be either "on" or "off". If index is divisible by current, the element becomes opposite.

# We could have a method that replicates the output from the description of this problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we go about writing that code?
