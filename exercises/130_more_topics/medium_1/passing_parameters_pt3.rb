# Passing Parameters Part 3
#
# Given this code:
#
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end
#
# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:
#
# 1)
#
gather(items) do |*vegetables, grain|
  puts vegetables.join(", ")
  puts grain
end
#
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
#
# 2)
#
gather(items) do |fruit, *vegetables, grain|
  puts fruit
  puts vegetables.join(", ")
  puts grain
end
#
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!
#
# 3)
#
gather(items) do |fruit, *other_food|
  puts fruit
  puts other_food.join(", ")
end
#
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!
#
# 4)
#
gather(items) do |fruit, starch, veggie, grain|
  puts "#{fruit}, #{starch}, #{veggie}, and #{grain}"
end
#
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
