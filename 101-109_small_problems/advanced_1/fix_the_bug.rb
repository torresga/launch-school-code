# Fix the Bug
# The following code:
#

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end


# is expected to print:
#
# p my_method([]) # []
# p my_method([3]) # [21]
# p my_method([3, 4]) # [9, 16]
# p my_method([5, 6, 7]) # [25, 36, 49]

# However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.

# From looking at the code, expected results, and actual results, here is the intended pseudocode for this method:
# If array.empty?
#   return empty array
# Else if array.length > 1
#  Create transformed array with element * element
# Else
#  Return 7 * element]

# From commenting out each if branch, I realized that the elsif statement was the branch causing the problem. Elsif was missing a conditional expression. Once I added in the proper condition, (array.length > 1) The method was working as expected.

# Why is elsif the problem? There is not a conditional expression on that line. However, Ruby interprets the call to map as the conditional expression. Since the return value of map is considered truthy, that branch is always considered true if the first branch, array.empty? is considered false. The statement inside of the else branch is never run.

# So line 8 is interpreted by Ruby as elsif array.map { |value| value * value }. Since the call to map is considered elsif's expression and not returned by the method, if returns nil. We can see that if statements return nil from the method below. The conditional statement is always true, and since if does not return anything else, it returns nil:

  def meth
    if 5
    end
  end

p meth

# This is why the remaining three calls to my_method output nil. In the first example, if array.empty? is true and an empty array is returned.
