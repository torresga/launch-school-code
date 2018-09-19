count = 1

loop do
  if count <= 5
    puts "#{count} is even!" if count.even?
    puts "#{count} is odd!" if count.odd?
  else
    break
  end
  count += 1
end
