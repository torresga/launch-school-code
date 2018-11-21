name = 'Bob'
save_name = name
name.upcase!
puts name, save_name #=> BOB, BOB

# The last line prints out BOB, BOB because both name and save_name still refer to the same object. upcase! is a mutating object that mutates its' caller. because both name and save_name refer to the same object, printing out both outputs the same value twice.
