# merge
dogs = {trip: 'collie', fifi: 'collie'}
lulu = {lulu: 'collie'}
puts "Merging hash: #{dogs.merge(lulu)}"
puts "Resulting hash: #{dogs}"
puts "Original hash: #{lulu}"

# merge!
cats = { grainne: 'grey tabby'}
gobo = { gobo: 'brown tabby'}
puts "Merging hash: #{cats.merge!(gobo)}"
puts "Resulting hash: #{cats}"
puts "Original hash: #{gobo}"
