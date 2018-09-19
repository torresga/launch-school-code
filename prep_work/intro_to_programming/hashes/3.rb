dogs = {trip: 'collie', fifi: 'collie', lulu: 'collie', moe: 'mutt', charlie: 'king charles spaniel'}

puts "All the keys:"
dogs.each_key {|k| puts k}

puts "All the values:"
dogs.each_value {|v| puts v}

puts "All the everything:"
dogs.each {|k, v| puts "#{k}: #{v}"}
