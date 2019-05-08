# How would you order this array of number strings by descending numeric value?

# arr = ['10', '11', '9', '7', '8']
# => ['11', '10', '9', '8', '7']

arr = ['10', '11', '9', '7', '8']

arr.map(&:to_i).sort {|n, n2| n2 <=> n }.map(&:to_s)
