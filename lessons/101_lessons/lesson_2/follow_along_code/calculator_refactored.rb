# Asks for two numbers
# Asks for the type of operation to perform (add, subtract, multiply, or divide)
# Displays result

def prompt(message)
  Kernel.puts("=> #{message}")
end

# Methods ending in ? are a convention in Ruby
# usually returns true or false
def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    # Do not need a return statement here.
    # Ruby returns the last expression in a method.
    # One of these expressions are returned by the case statement when
    # condition is true, and because it's the last expression in a method,
    # the expression is also returned by the method.
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

# parentheses are optional when invoking a method call
prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  # This variable has to be called in the outermost scope
  # that's common between all loops.
  number1 = ''
  loop do
    # loops create a new scope
    prompt("What's the first number?")
    # since we initially set the variable inside this loop,
    # its value cannot be seen outside of the loop because
    # it is in a different scope
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  # <<-name_of_delimiter is another way of creating multi-line strings.
  # Just need to have two matching delimiters on each end.
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    # %w is another way of writing an array of strings: ["1", "2", "3", "4"]
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  # as with if statements, we can assign the result of a case statement
  # to a variable
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  # this statement means that if y is entered, the loop continues from the top,
  # else the loop breaks
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")
