arr = ["person1", "person2", 32, "g", 34]
arr.each_with_index do |element, index|
  puts "#{index}: #{element}"
end
