# 4. Adding a configuration
require 'yaml'

messages = YAML.load(File.read("messages_international.yml"))

operations = messages[0]["operations"]

salutations = messages[1]["salutations"]

questions = messages[2]["questions"]

warnings = messages[3]["warnings"]

answers = messages[4]["answers"]

display_results = messages[5]["display_results"]


def prompt(message)
  Kernel.puts("=> #{message}")
end

# 1. Better integer validation
# We can check if the number is of the class integer
# The input is always a string, so can we check for numeric integers in the string?

# 2. To Check for floats, we can use similar strategies to the first question
# input.to_f.to_s == input - has an edge case, '1.'.to_f.to_s does not equal input
# We could use a regular expression
# /^\d+.\d+$/.match(input) - has two edge cases, does not match "32." or ".13"
# We could use the Kernel#Float method
# Each of these would only test for their respective number type, so we would have to test whether input was an integer or a float

def valid_number?(num)
  # we can do this with a regex expression
  # this also returns true if the number is a float
  num.match?(/[0-9]/)
end

def operation_to_message(op, operations, lang)
  # 3. easiest way to manage this is to assign the result of case to a variable
  option = case op
  when '1'
    operations["addition"][lang]
  when '2'
    operations["subtraction"][lang]
  when '3'
    operations["multiplication"][lang]
  when '4'
    operations["division"][lang]
  end
  # then we can add option to be the last line of the method
  # we can also expicitly return option with the return keyword. that way we wouldn't have to worry whether
  # return was the last line of the method
  option
end


prompt(salutations["language"])
lang = ''
loop do
  lang = Kernel.gets().chomp()

  break if lang == 'en' || lang == 'fr'

  prompt(warnings["invalidLanguage"])
end



prompt(salutations["welcome"][lang])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(warnings["invalidName"][lang])
  else
    break
  end
end

prompt("#{salutations["hello"][lang]} #{name}!")

loop do
  number1 = ''
  loop do
    prompt(questions["askingForNumbers"][lang].first)

    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(warnings["invalidNumber"][lang])
    end
  end

  number2 = ''
  loop do
    prompt(questions["askingForNumbers"][lang].last)
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(warnings["invalidNumber"][lang])
    end
  end

  operator_prompt = questions["askingForOperator"][lang]
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(warnings["invalidOperation"][lang])
    end
  end

  prompt("#{operation_to_message(operator, operations, lang)} #{display_results["operating"][lang]}")

  result = case operator
  when answers["addition"]
             number1.to_i() + number2.to_i()
           when answers["subtraction"]
             number1.to_i() - number2.to_i()
           when answers["multiplication"]
             number1.to_i() * number2.to_i()
           when answers["division"]
             number1.to_f() / number2.to_f()
           end

  prompt("#{display_results["result"][lang]} #{result}")

  prompt(questions["askingToCalculateAgain"][lang])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?(answers["calculateAgain"][lang])
end

prompt(salutations["goodbye"][lang])
