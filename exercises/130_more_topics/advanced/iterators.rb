# In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may define what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite list of factorials. Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.
#
# More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, reset your Enumerator. Finally, reprint those same 7 factorials using your Enumerator object as an "Internal Iterator".
#
# You can find almost everything you need for this exercise in the documentation for Enumerator. In particular, check out the ::new method; it should prove a good starting point for this exercise. Some further details about internal vs external iterators are mentioned at the start of that documentation, so make sure to read that section. Keep in mind that that section can be a bit dense; if you don't understand everything about it, that's ok.
#
# The wikipedia page on factorials may also be of some use.
#
# Two final hints:
#
#     You'll only need 3 Enumerator methods to complete this exercise.
#     An Enumerator also implements the Enumerable module. Keep this in mind, as it may make certain parts of this exercise easier to write.

# Step 1: Create a new Enumerator object
# Step 2: Use an external iterator to print first 7 factorials
# Step 3: Reset Enumerator
# Step 4: Use an internal iterator to print first 7 factorials
# Factorial is n! - n * (n - 1) * (n - 2)...3 * 2 * 1

require 'pry'

enum = Enumerator.new do |n|
  count = 1
  current = 1

  loop do
    n << current
    current = current * count
    count += 1
  end
end

# External iteration
7.times do
  puts enum.next
end

# don't necessarily need this for my implementation, since I start at beginning with #first
enum.rewind

# Internal iteration
enum.first(7).each { |factorial| puts factorial }
