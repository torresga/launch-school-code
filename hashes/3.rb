new_hash = {:name=>"larry", :age=>42, :favorite_food=>"muffins", :pets=>"gobo"}

new_hash.keys.each {|k| puts k}
puts "\n"

new_hash.values.each {|v| puts v}
puts "\n"

new_hash.each do |k, v|
  puts "#{k}: #{v}"
end
