names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.size == 0
end

# Further exploration - change names printed to last to first:
# loop do
#   puts names.pop
#   break if names.size == 0
# end
