# PEDAC

# Identify expected input or output
# input
# loan amount
# annual percentage rate (APR)
# the loan duration in years or months

# output
# monthly payment

# Make requirements explicit
# in the algorithm we have
# monthly payment
# loan amount
# monthly interest rate
# loan duration in months
# what we need to calculate: monthly interest rate, loan duration in months
# once we have all those things then we can calculate the monthly payment

# Identify rules
# loan duration input can be in either months or years,
# but if in years, multiply by 12 to get months
# Interest rate can be expressed as whole number,
# and then the fraction can be calculated from that

# Create examples/test cases to validate understanding of problem
# According to a car payment calculator found on Google:
# A loan amount of 20,000 with 4% interest rate with a loan period
# of 72 months, the monthly payments would be $313.

# Data structures
# Since we are dealing with money, it would make more sense if loan
# amount was entered as a Float.
# APR can be entered as an Integer

# Algorithm
# Ask user to input a loan amount
# Ask user to input their annual percentage rate (APR)
# Ask user to input loan duration
# Ask user to input y if duration is in years or m if durations is in months
# Convert loan duration to months if input is in years
# Calculate monthly interest rate
# monthy_payment = loan_amount *
# (monthly_interest_rate / (1 - (1 + monthly_interest_rate)
# **-loan_duration_in_months))

# Code
# Re-using this prompt from the last exercise
def prompt(message)
  Kernel.puts("=> #{message}")
end

def calc_monthly_interest(apr)
  apr = apr.to_f / 100
  monthly_interest_rate = apr / 12
  monthly_interest_rate
end

def calc_payment(amount, monthly_rate, loan_duration)
  amount * (monthly_rate / (1 - (1 + monthly_rate)**-loan_duration))
end

prompt("Welcome to the Mortgage Calculator!")

loop do
  # Things to incorporate from the solution:
  # 1. We can put the body in a loop,
  # in case your user wants to run the program again.
  # 2. We can check input here, making sure that the input
  # is non-empty and is a positive number. We can surround this
  # prompt and gets with a loop that only breaks if the above
  # conditions are true.
  prompt("Please enter your loan amount:")
  loan_amount = gets.to_f

  # 3. We can also check this input to make sure that the input is
  # non-empty and a positive integer. We can also surround this prompt
  # and gets with a loop that only breaks if the above conditions are true.
  prompt("Please enter your annual percentage rate (APR):")
  apr = gets.to_i

  # 4. This can also be checked by the same loop and conditions described above.
  prompt("Please enter your loan duration:")
  loan_duration = gets.to_i

  duration = ''
  loop do
    prompt("Please enter 'm' for months or 'y' for years:")
    duration = gets.chomp

    break if duration == "m" || duration == "y"
    prompt("Invalid input! Please enter 'm' for months and 'y' for years:")
  end

  loan_duration *= 12 if duration == "y"

  monthly_interest_rate = calc_monthly_interest(apr)

  payment = calc_payment(loan_amount, monthly_interest_rate, loan_duration)

  prompt("Your monthly payment would be: $#{payment}")

  # Below we can ask if the user would like to calculate another
  # monthly payment, and break if the user enters anything other than y.
  prompt("Would you like to calculate another monthly payment? (y or n)")
  answer = gets.chomp.downcase

  break if answer != "y"
end

# Answers for the things to think about section
# 1. Format is a method in the Kernel module. Like puts and gets,
# it is available to us without having to call Kernel specifically.
# 3. format('%02.2f', monthly_payment) formats the payment as a decimal
# with 2 numbers after the decimal point.
# 4. Code without the optional parentheses:
# def prompt(message)
#   Kernel.puts "=> #{message}"
# end
#
# loop do
#   prompt("Welcome to Mortgage Calculator!")
#   prompt("-------------------------------")
#
#   prompt("What is the loan amount?")
#
#   amount = ''
#   loop do
#     amount = Kernel.gets.chomp
#
#     if amount.empty? || amount.to_f < 0
#       prompt("Must enter positive number.")
#     else
#       break
#     end
#   end
#
#   prompt("What is the interest rate?")
#   prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
#
#   interest_rate = ''
#   loop do
#     interest_rate = Kernel.gets.chomp
#
#     if interest_rate.empty? || interest_rate.to_f < 0
#       prompt("Must enter positive number.")
#     else
#       break
#     end
#   end
#
#   prompt("What is the loan duration (in years)?")
#
#   years = ''
#   loop do
#     years = Kernel.gets.chomp
#
#     if years.empty? || years.to_i < 0
#       prompt("Enter a valid number")
#     else
#       break
#     end
#   end
#
#   annual_interest_rate = interest_rate.to_f / 100
#   monthly_interest_rate = annual_interest_rate / 12
#   months = years.to_i * 12
#
#   monthly_payment = amount.to_f *
#                     (monthly_interest_rate /
#                     (1 - (1 + monthly_interest_rate)**(-months.to_i))
#
#   prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
#
#   prompt("Another calculation?")
#   answer = Kernel.gets.chomp
#
#   break unless answer.downcase().start_with?('y')
# end
#
# prompt("Thank you for using the Mortgage Calculator!")
# prompt("Good bye!")
# The methods are still recognizeable since I already know
# they are methods. If I wasn't already familiar with the methods
# I might not recognize them.
