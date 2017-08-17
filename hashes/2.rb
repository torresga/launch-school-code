hash_one = {name: "larry", age: 42}
hash_two = {favorite_food: "muffins", pets: "gobo"}


puts "here is using merge"
puts hash_one.merge(hash_two)
puts hash_one
puts hash_two

puts "here is using merge!"
puts hash_one.merge!(hash_two)
puts hash_one
puts hash_two
