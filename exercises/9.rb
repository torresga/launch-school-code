h = {a: 1, b: 2, c: 3, d: 4}

puts "1. #{h[:b]}"

h[:e] = 5

puts "2. #{h}"

h.delete_if {|k, v| v < 3.5 }

puts "3. #{h}"
