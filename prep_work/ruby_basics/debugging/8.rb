colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  # colors.length may be 8 but the array starts from 0 and ends at 7 so color[8] and things[8] is going to be nil
  # we can check if i is equal to the length of either array
  break if i == colors.length || i == things.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    # Eventually raises a type error because the things array is smaller than the colors array
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end
