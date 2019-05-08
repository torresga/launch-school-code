# Methods have their own scope. The variable 'limit' and the method 'fib' are in two different scopes. Therefore, 'fib' cannot see 'limit' unless 'limit' is passed into the method as a parameter.

limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"