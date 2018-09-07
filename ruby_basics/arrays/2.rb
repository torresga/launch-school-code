pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = [pets[2], pets[3]]
# Other ways to do this
# my_pets = pets[2..3]
# my_pets = pets.pop(2)

puts "I have a pet #{my_pets.first} and a pet #{my_pets.last}"
# Other ways to do this
# puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"
# puts "I have a pet " + my_pets.first + " and a pet " + my_pets.last
