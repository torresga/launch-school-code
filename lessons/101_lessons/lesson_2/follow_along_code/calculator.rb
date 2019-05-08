# Asks for two numbers
# Asks for the type of operation to perform (add, subtract, multiply, or divide)
# Displays result

# parentheses are optional when invoking a method call
Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts(number1 + " " + number2)

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

# also, if statements can return a value
# you can assign an if statement to a variable
if operator == '1'
  # This variable can be seen outside of the if statement because if statements don't create blocks (so they don't create a new scope)
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
elsif operator == '4'
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}")
