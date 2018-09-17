arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|s| s.start_with?("s")}

puts "arr: #{arr}"

new_arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

new_arr.delete_if {|s| s.start_with?("s") || s.start_with?("w")}

puts "new arr: #{new_arr}"
