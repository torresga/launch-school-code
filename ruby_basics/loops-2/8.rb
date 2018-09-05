require 'pry'

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# For futher exploration:
# next has to be placed after the incrementation of number
# because at first number starts at 0, 1 is added to it, it is printed and it goes through the loop again
# then 1 is found to be odd and the loop starts at the beginning again
# then 1 is found to be odd and the loop starts at the beginning again
# so basically number never increments and the loop never ends
# next has to be placed before the number is printed or else all the numbers will be printed
