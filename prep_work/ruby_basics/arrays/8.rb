array = ['Dave', 7, 'Miranda', 3, 'Jason', 11]

pair_1 = array[0..1]
pair_2 = array[2..3]
pair_3 = array[4..5]

# this will be [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
new_array = [pair_1, pair_2, pair_3]
p new_array
