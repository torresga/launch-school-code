# array1 => ["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]
# array2 => []
# array2 => ["Moe", "Larry", "Curly", "Shemp", "Harpo", "Chico", "Groucho", "Zeppo"]
# array1 => ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"]
# array2 => ["Moe", "Larry", "CURLY", "SHEMP", "Harpo", "CHICO", "Groucho", "Zeppo"] because array2 and array1 reference the same objects in both collections.

# Further Exploration
# How can this feature of ruby get you in trouble? How can you avoid it?
# This feature can get you in trouble if you are trying to copy the values of one array's objects over to another (but not the references to the same objects). If you want to modify the elements of just one of the arrays, you will end up modifying the elements of both arrays, as seen above.
#
# One way to avoid this is to use Obj#dup on line 3 instead of copying the element directly: array1.each { |value| array2 << value.dup }
