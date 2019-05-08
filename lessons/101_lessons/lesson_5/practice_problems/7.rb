# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]
# [2, [5, 8]]

arr[0] += 2
# [4, [5, 8]]

arr[1][0] -= a
# a is still 2 because arr[0] += 2 is pointing to new value in a different memory location (because assignment is not mutation)
# [4, [3, 8]]
