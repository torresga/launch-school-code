status = ['awake', 'tired'].sample

# We can also assign a whole if statement into a variable.
# value = if status == 'awake'
# 'Be productive!'
# else
# 'Go to sleep!'
# end

if status == 'awake'
  value = "Be productive!"
else
  value = "Go to sleep!"
end

puts value
